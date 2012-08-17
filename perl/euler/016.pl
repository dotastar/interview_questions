# 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^(1000)?
use Time::HiRes qw( gettimeofday tv_interval );
use POSIX;

$|=1;
$t0 = [gettimeofday];
@powergrid;

for($i=0;$i<302;$i++){
	$powergrid[0][$i]=0;
}

for($i=0;$i<1000;$i=$i+4){
	$powergrid[$i][0]  =2;
	$powergrid[$i+1][0]=4;
	$powergrid[$i+2][0]=8;
	$powergrid[$i+3][0]=6;
}

for($col=1;$col<302;$col++){
	for($row=1;$row<1000;$row++){
		$powergrid[$row][$col]=(2*$powergrid[$row-1][$col]+floor($powergrid[$row-1][$col-1]/5)) % 10;
	}
}

my $sum = 0;
for($i=0;$i<302;$i++){
	$sum+= $powergrid[999][$i];
}

print "$sum\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";
