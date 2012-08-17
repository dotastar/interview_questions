<?php
//Sets a timezone so that I can do strtotime().
date_default_timezone_set('UTC');

/*******************************************************************************
 *                              Helper Classes
 * Normally, these would each be in their own file, but for the sake of fast
 * developing, they are included here.
 ******************************************************************************/
 
/**
 * Tracks all the data gathered from calendar.csv. 
 * Can determine whether or not a date is available and if there is a special price.
 */
class Availability {
  const IS_AVAILABLE = 'avail';
  const PRICE = 'price';
  
  private $m_dates = array();
  
  public function __construct($a_dates = null) {
    if (!$a_dates) {
      $a_dates = array();
    }
    
    $this->m_dates = $a_dates;
  }
  
  public function isAvailable($a_date) {
    return !isset($this->m_dates[$a_date]) || $this->m_dates[$a_date][self::IS_AVAILABLE];
  }
  
  public function getPrice($a_date) {
    return isset($this->m_dates[$a_date]) ? $this->m_dates[$a_date][self::PRICE] : false;
  }
}

/**
 * Tracks all data from properties.csv
 * Represents a listing. Given a range, can determine how much it would cost to stay there,
 * or if listing is not available for all dates.
 */
class Property {
  const DAY_AS_SECONDS = 86400; //24 * 60 * 60
  
  private $m_id;
  private $m_price;
  private $m_latitude;
  private $m_longitude;
  private $m_avail;
  
  public function __construct($a_id, $a_price, $a_latitude, $a_longitude, $a_avail = null) {
    $this->m_id = $a_id;
    $this->m_price = $a_price;
    $this->m_latitude = $a_latitude;
    $this->m_longitude= $a_longitude;

    $this->m_avail = new Availability($a_avail);
  }
  
  public function getTotalPrice($a_startDate, $a_endDate) {
    $price = 0;
    //Saw some search results have the same checkin and checkout date. Referencing airbnb.com, 
    //it seems this not valid input: http://i.imgur.com/GIT8H.png
    //Without returning false right here, it would create a search result where the
    //stay cost 0. This doesn't seem useful.
    if ($a_startDate >= $a_endDate) {
      return false;
    }
    
    //$date < $endDate instead of <= because you are checking out on $endDate, and therefore are not charged for the night.
    for($date = $a_startDate; $date < $a_endDate; $date += self::DAY_AS_SECONDS) {
      if ($this->m_avail->isAvailable($date)) { //Make sure this date is free
        $priceForNight = $this->m_avail->getPrice($date);
        
        if ($priceForNight !== false) { //Special price
          $price += $priceForNight;
        } else { //Standard price
          $price += $this->m_price;
        }
      } else { //Can't rent this place because date is unavailable.
        return false;
      }
    }

    return $price;
  }
  
  public function getId() {
    return $this->m_id;
  }
  
  //Given a longitude and latitude, determines if the listing is at most 2 degrees square in total away.
  public function isCloseTo($a_lat, $a_long, $a_maxSquareDistance = 1) {
    return (abs($a_lat - $this->m_latitude) <= $a_maxSquareDistance) && (abs($a_long - $this->m_longitude) <= $a_maxSquareDistance); 
  }
}

/*******************************************************************************
 *                       START OF MAIN CODE EXECUTION
 ******************************************************************************/
$output = ''; //final output.

// PARSING THROUGH CALENDAR.CSV
$calendarFile = isset($argv[2]) ? $argv[2] : 'calendar.csv';
$lines = file($calendarFile); //gets the file contents as an array of lines.
$availabilities = array();
foreach ($lines as $line) {
  $avail = explode(',', $line);
  //$avail[0]: property id
  //      [1]: date
  //      [2]: available?
  //      [3]: special price
  
  if (!isset($availabilities[$avail[0]])) {
    $availabilities[$avail[0]] = array();
  }
  
  //storing as unix timestamp is much easier - easier to increment date, rolling from one
  //month/year to the next. Also, if later we need to do other processing on this data,
  //timestamp is generally much better supported across different services/coding languages/libraries/etc.
  $ts = strtotime($avail[1]);
  
  $availabilities[$avail[0]][$ts] = array(Availability::IS_AVAILABLE => $avail[2], Availability::PRICE => $avail[3]);
}

// PARSING THROUGH PROPERTIES.CSV
$propertiesFile = isset($argv[1]) ? $argv[1] : 'properties.csv';
$lines = file($propertiesFile);
$properties = array();
foreach ($lines as $line) {
  $listing = explode(',', $line);
  //$listing[0]: property id
  //        [1]: latitude
  //        [2]: longitude
  //        [3]: standard price
  
  //We are going to eventually group properties by the floor of their long/lat
  //This allows us to later quickly grab only the relevant listings when executing a search.
  $latRoundedDown = floor($listing[1]);
  $longRoundedDown = floor($listing[2]);
  
  if (!isset($properties[$latRoundedDown])) {
    $properties[$latRoundedDown] = array();
  }
  
  if (!isset($properties[$latRoundedDown][$longRoundedDown])) {
    $properties[$latRoundedDown][$longRoundedDown] = array();
  }
  
  $properties[$latRoundedDown][$longRoundedDown][] = new Property($listing[0], $listing[3], $listing[1], $listing[2], $availabilities[$listing[0]]);
}

// PARSING THROUGH SEARCHES.CSV
$searchesFile = isset($argv[3]) ? $argv[3] : 'searches.csv';
$lines = file($searchesFile);
foreach($lines as $line) {
  $query = explode(',', $line);
  //$query[0]: query id
  //      [1]: latitude
  //      [2]: longitude
  //      [3]: checkin date
  //      [4]: checkout date
  
  //Find nearest whole lat/long so that we can quickly look up nearby listings.
  $latRoundedDown = floor($query[1]);
  $longRoundedDown = floor($query[2]);
  
  /*
   * We have already organized the listings in a 2-d array that represents a coarse 2-d
   * map/grid of the listings by geographic locaton. We know that for the search location
   * (represented below by the X), where all the possible listings would be (represented by
   * O):
   *
   * O O O
   * O X O
   * O O O
   *
   * along with, of course, all listings located at X.
   */
  $possibleListings = array();
  for ($lat = $latRoundedDown - 1; $lat <= $latRoundedDown + 1; $lat++) {
    for ($long = $longRoundedDown - 1; $long <= $longRoundedDown + 1; $long++) {
      if (isset($properties[$lat][$long])) {
        $possibleListings = array_merge($possibleListings, $properties[$lat][$long]);
      }
    }
  }
  
  // FIND THE <=10 CHEAPEST DEALS
  $tenCheapest = array();
  foreach ($possibleListings as $possibleListing) {
    //There is a chance that even if the listing is located in an adjacent square, it's still too
    //far away. Eg. if the latitude of the search is 16.9 and the latitude of the listing is 15.1.
    if($possibleListing->isCloseTo($query[1], $query[2])) {
      $totalPrice = $possibleListing->getTotalPrice(strtotime($query[3]), strtotime($query[4]));
      
      if ($totalPrice !== false) { //ie the listing is available during the time frame.
          //see if the total price is less than the top 10 found so far.
          for ($pos = 0; $pos < 10 && $pos < count($tenCheapest); $pos++) {
            if ($tenCheapest[$pos]['cost'] > $totalPrice) {
              break;
            }
          }
          
          //If there are fewer than 10 listings, then just add it to the end.
          if ($pos < 10) {
            $result = array('id' => $possibleListing->getId(), 'cost' => $totalPrice);
            array_splice($tenCheapest, $pos, 0, array($result)); //equivalent to insertAt()
          }
      }
    }
  }
  
  //Save out the 10 cheapest.
  for ($pos = 0; $pos < 10 && $pos < count($tenCheapest); $pos++) {
    $output .= $query[0] . ',' . $pos . ',' . $tenCheapest[$pos]['id'] . ',' . $tenCheapest[$pos]['cost'] . "\n";
  }
}

//Print out result.
//echo $output;
file_put_contents('search_results.csv', $output);
?>