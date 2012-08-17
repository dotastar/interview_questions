#The sequence of triangle numbers is generated by adding the natural numbers. 
#So the 7^(th) triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
#The first ten terms would be:
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#Let us list the factors of the first seven triangle numbers:
#
#     1: 1
#     3: 1,3
#     6: 1,2,3,6
#    10: 1,2,5,10
#    15: 1,3,5,15
#    21: 1,3,7,21
#    28: 1,2,4,7,14,28
#
#We can see that 28 is the first triangle number to have over five divisors.
#
#What is the value of the first triangle number to have over five hundred divisors?
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];
$summation = 4648*4649/2;
$currentNumber =4649;

while(1){
	print "\rTesting triangle number $currentNumber";
	$summation += $currentNumber;
	$stop = sqrt($summation);
	$divisorCount=0;
	for($i=1;$i<=$stop;$i++){
		if($summation % $i ==0){
			$divisorCount+=2;
			if($divisorCount>500){
				print "\nTriangle number $currentNumber, which is $summation, has $divisorCount divisors.\n";
				print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";
				exit;
			}
		}
	}
	$currentNumber++;
}