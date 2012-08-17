#A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
#
#    1/2	= 	0.5
#    1/3	= 	0.(3)
#    1/4	= 	0.25
#    1/5	= 	0.2
#    1/6	= 	0.1(6)
#    1/7	= 	0.(142857)
#    1/8	= 	0.125
#    1/9	= 	0.(1)
#    1/10	= 	0.1
#
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that ^(1)/_(7) has a 6-digit recurring cycle.
#
#Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
use Math::BigInt;
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$recurring = 6;
$number = 7;

for($i=11;$i<1000;$i++){
	print "\rTesting $i";
	$seqCount = recurringSeqLength($i);
	if($recurring<$seqCount){
		$recurring=$seqCount;
		$number = $i;
	}
}

print "\n$number with $recurring recurring digits\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";

sub recurringSeqLength{
	$numerator = 1;
	$denominator = shift;
	@remainders = (1);
	
	while(1){
		while($numerator<$denominator){
			$numerator*=10;
		}
		
		$numerator = $numerator % $denominator;
		if($numerator==0){
			return scalar(@remainders);
		}
		for($j=0;$j<scalar(@remainders);$j++){
			if($numerator==$remainders[$j]){
				return scalar(@remainders)-$j;
			}
		}
		push(@remainders,$numerator);
	}
}