#Euler published the remarkable quadratic formula:
#
#n² + n + 41
#
#It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 40^(2) + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
#
#Using computers, the incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
#
#Considering quadratics of the form:
#
#    n² + an + b, where |a| < 1000 and |b| < 1000
#
#    where |n| is the modulus/absolute value of n
#    e.g. |11| = 11 and |−4| = 4
#
#Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
use Math::BigInt;
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$numPrimes=0;
$product=0;

for($a=-999;$a<1000;$a++){
	for($b=-999;$b<1000;$b++){
		print "\rTesting coefficients $a and $b  ";
		$n=0;
		while(isPrime(($n**2)+($a*$n)+$b)){
			$n++;
		}
		if($n>$numPrimes){
			$numPrimes = $n;
			$product = $a*$b;
		}
	}
}

print "\nsoln: $product\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";

sub isPrime{
	my $num = shift;
	if($num<0){
		return 0;
	}
	
	for(my $i=2;$i<sqrt($num);$i++){
		if($num % $i ==0){
			return 0;
		}
	}
	
	return 1;
}