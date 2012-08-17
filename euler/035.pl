#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
#How many circular primes are there below one million?

use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$circCount = 0;

for(my $num=2;$num<1000000;$num++){
	if(isPrime($num)){
		$isCircular=1;
		for($i=1;$i<length($num);$i++){
			$newNum = substr($num,$i) . substr($num,0,$i);
			if(!isPrime($newNum)){
				$isCircular=0;
				last;
			}
		}
		if($isCircular==1){
			print "$num\n";
			$circCount++;
		}
	}
}

print "soln: $circCount\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";

sub isPrime{
	my $num = shift;
	if($num<0){
		return 0;
	}
	
	for(my $i=2;$i<=sqrt($num);$i++){
		if($num % $i ==0){
			return 0;
		}
	}
	
	return 1;
}