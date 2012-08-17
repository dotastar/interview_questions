# You are given the following information, but you may prefer to do some research for yourself.

    # * 1 Jan 1900 was a Monday.
    # * Thirty days has September,
      # April, June and November.
      # All the rest have thirty-one,
      # Saving February alone,
      # Which has twenty-eight, rain or shine.
      # And on leap years, twenty-nine.
    # * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

my @daysInMonth = (31,28,31,30,31,30,31,31,30,31,30,31);
my $currDay = 1;
my $sundays = 0;

for($year=1900;$year<=2000;$year++){
	$isLeap=0;
	if(($year % 400==0) || ($year % 100!=0 && $year % 4==0)){
		$isLeap=1;
	}
	for($month=1;$month<=12;$month++){
		if(!($year==1900 && $month==1)){
			$prevMonthIndex = $month-2;
			if($prevMonthIndex<0){
				$prevMonthIndex=11;
			}
			if($month==3 && $isLeap){
				$currDay = ($currDay + 29) %7;
			} else{
				$currDay = ($currDay + $daysInMonth[$prevMonthIndex]) % 7;
			}
			if($currDay==0){
				#print "$month/$year\n";
				if($year>1900){
					$sunday++;
				}
			}
		}
	}
}
print "soln: $sunday\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";