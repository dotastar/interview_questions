# The following iterative sequence is defined for the set of positive integers:

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];
$maxIter=0;
$startingNum;

for($i=1;$i<1000000;$i++){
	$num = $i;
	$iterCount=1;
	while($num!=1){
		if($num % 2 ==0){
			$num = $num/2;
		} else {
			$num = 3*$num+1;
		}
		$iterCount++;
	}
	if($iterCount>$maxIter){
		$maxIter=$iterCount;
		$startingNum=$i;
	}
}

print "$startingNum has a chain of size $maxIter\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";