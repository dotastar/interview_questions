# The Fibonacci sequence is defined by the recurrence relation:

    # F_(n) = F_(n-1) + F_(n-2), where F_(1) = 1 and F_(2) = 1.

# Hence the first 12 terms will be:

    # F_(1) = 1
    # F_(2) = 1
    # F_(3) = 2
    # F_(4) = 3
    # F_(5) = 5
    # F_(6) = 8
    # F_(7) = 13
    # F_(8) = 21
    # F_(9) = 34
    # F_(10) = 55
    # F_(11) = 89
    # F_(12) = 144

# The 12th term, F_(12), is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?
use Math::BigInt;
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$term = Math::BigInt->new(13);
$num1 = Math::BigInt->new(89);
$num2 = Math::BigInt->new(144);

while(1){
	print "\rTrying $term";
	$fib = $num1 + $num2;
	if(scalar(split(//,$fib))>=1000){
		print "\nsoln: $term\n";
		print "number: $fib\n";
		print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";
		exit;
	}
	$num1 = $num2;
	$num2 = $fib;
	$term++;
}