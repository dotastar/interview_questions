# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

my $sum = 0;
@abundants;

for($num=1;$num<28123;$num++){
	print "\rTesting $num";
	#check if sum of two abundant numbers
	if(isSumOfTwoAbundants($num)==0){
		#print "$num is NOT the sum of two abundant numbers!\n";
		$sum+=$num;
	}

	#check if abundant
	$sumOfDivisors = 1;
	for($i=2;$i<=sqrt($num);$i++){
		if($sumOfDivisors>$num){
			last;
		}
		if($num % $i==0){
			$sumOfDivisors+=$i;
			if($i != $num/$i){
				$sumOfDivisors+= $num/$i;
			}
		}
	}
	if($sumOfDivisors>$num){
		#print "$num is an abundant number.\n";
		push(@abundants,$num);
	}
}

#print "abundants: @abundants\n";
print "\nTotal: $sum\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";

sub isSumOfTwoAbundants{
	$number = shift;
	$lower =0;
	$upper =scalar(@abundants)-1;
	while($lower<=$upper){
		$tempSum = $abundants[$lower]+$abundants[$upper];
		if($tempSum>$number){
			$upper--;
		} elsif($tempSum<$number){
			$lower++;
		} elsif($tempSum==$number){
			return 1;
		} else {
			print "ERROR!\n";
			exit;
		}
	}
	return 0;
}