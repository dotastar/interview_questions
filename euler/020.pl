# n! means n × (n - 1) × ... × 3 × 2 × 1

# Find the sum of the digits in the number 100!
use Math::BigInt;
use List::Util qw(sum);
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$fact = Math::BigInt->bone();;
for($i=2;$i<=100;$i++){
	$num = $i;
	while($num % 10 ==0){
		$num /=10;
	}
	$fact *=$num;
	while($fact % 10 ==0){
		$fact /=10;
	}
	#print "$i: $fact\n";
}

@digits = split(//,$fact);

print sum(@digits) . "\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";