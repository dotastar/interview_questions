#!/usr/local/bin/perl
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.
$|=1;

my @primes=(2, 3, 5, 7, 11, 13);
my $sum = 2+3+5+7+11+13;

for($num=14;$num<2000000;$num++){
	print "\rTesting $num";
	$isPrime=1;
	foreach $prime(@primes){
		if($num % $prime==0){
			$isPrime=0;
			last;
		}
	}
	if($isPrime){
		push(@primes,$num);
		$sum += $num;
		print "...Prime!\n";
	}
}

print "\n" . $sum . "\n";