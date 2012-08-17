# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
use Time::HiRes qw( gettimeofday tv_interval );
use POSIX;
$|=1;
$t0 = [gettimeofday];

my $totalLength =0;

@singles = (-10000, length("one"), length("two"), length("three"), 
            length("four"), length("five"), length("six"), length("seven"),
			length("eight"), length("nine"));
@teens   = (length("ten"), length("eleven"), length("twelve"), length("thirteen"), 
            length("fourteen"), length("fifteen"), length("sixteen"), 
			length("seventeen"), length("eighteen"), length("nineteen"));
@tens    = (-10000, -10000, length("twenty"), length("thirty"), 
            length("forty"), length("fifty"), length("sixty"), length("seventy"), 
			length("eighty"), length("ninety"));
$hundred = length("hundred");
$and     = length("and");

for($num=1;$num<=1000;$num++){
	if($num==1000){
		$totalLength+= $singles[1] + length("thousand");
	} elsif($num>99){
		$totalLength+=$singles[floor($num/100)] + $hundred;
		if($num%100!=0){
			$totalLength+= $and;
		}
	}
	$tenDigit = floor($num/10) % 10;
	$singleDigit = $num % 10;
	if($tenDigit >1){
		$totalLength+=$tens[$tenDigit];
		if($singleDigit!=0){
			$totalLength+=$singles[$singleDigit];
		}
	} elsif($tenDigit ==1) {
		$totalLength+=$teens[$singleDigit];
	} else {
		if($singleDigit!=0){
			$totalLength+=$singles[$singleDigit];
		}
	}
	#print "$num: $totalLength\n";
}
	
print "$totalLength\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";