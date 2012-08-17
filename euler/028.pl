#Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
#              21 22 23 24 25
#              20  7  8  9 10
#              19  6  1  2 11
#              18  5  4  3 12
#              17 16 15 14 13
#
#It can be verified that the sum of the numbers on the diagonals is 101.
#
#What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$sum=1;
$num=3;

for($rowSize=3;$rowSize<=1001;$rowSize+=2){
	#Bottom Right
	#print "$num\n";
	$sum += $num;
	
	#Bottom Left
	$num += $rowSize-1;
	#print "$num\n";
	$sum += $num;
	
	#Top Left
	$num += $rowSize-1;
	#print "$num\n";
	$sum += $num;
	
	#Top Right
	$num += $rowSize-1;
	#print "$num\n";
	$sum += $num;
	
	#Setting up for Bottom Right
	$num += $rowSize+1;
}

print "\nsoln: $sum\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";