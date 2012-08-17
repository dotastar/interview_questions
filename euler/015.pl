# 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^(1000)?
use Time::HiRes qw( gettimeofday tv_interval );
use List::Util qw(sum);

$|=1;
$t0 = [gettimeofday];

$num = 2**1000;
print "$num\n";
@numArr = split(//,$num);
print $numArr[17] . "\n";
print sum(@numArr) . "\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";