#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
#Evaluate the sum of all the amicable numbers under 10000.
use Math::BigInt;
use List::Util qw(sum);
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

%sumOfDivisors = ();
$sumOfAmicableNumbers = 0;

for($j=1;$j<10000;$j++){
	$sumOfDivisors{$j}=d($j);
	#print "$j: " . d($j) . "\n";
}

while(($key,$value)=each(%sumOfDivisors)){
	if($key!=$value && defined($sumOfDivisors{$value}) && $sumOfDivisors{$value}==$key){
		print $key . ":" . $sumOfDivisors{$key} . " matched " . $value . ":" . $sumOfDivisors{$value} . "\n";
		$sumOfAmicableNumbers+=$key;
	}
}

print $sumOfAmicableNumbers . "\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";

sub d{
	$n = shift;
	$sum=1;
	for($i=2;$i<=sqrt($n);$i++){
		if($n % $i == 0){
			$sum+=$i;
			if($i != $n/$i){
				$sum+= $n/$i;
			}
		}
	}
	return $sum;
}