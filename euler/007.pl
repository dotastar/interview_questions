#!/usr/local/bin/perl
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6^(th) prime is 13.
#
#What is the 10001^(st) prime number?
$|=1;

my @primes=(2, 3, 5, 7, 11, 13);
my $primeCount=6;

for($num=14;;$num++){
	print "\rTesting $num";
	$isPrime=1;
	foreach $prime(@primes){
		if($num % $prime==0){
			$isPrime=0;
			last;
		}
	}
	if($isPrime){
		push(@primes, $num);
		$primeCount++;
		print "...Prime $primeCount!\n";
		if($primeCount==10001){
			print "\nSoln: $num\n";
			last;
		}
	}
}