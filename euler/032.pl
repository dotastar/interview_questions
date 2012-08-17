#In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
#
#    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
#It is possible to make £2 in the following way:
#
#    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
#How many different ways can £2 be made using any number of coins?
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

@ways = (0,1,2,2,3);

@coins = (1,2,5,10,20,50,100,200);

for($total=1;$total<=10;$total++){
	$sum=0;
	for($i=0;$i<=$total/2;$i++){
		$sum+=$ways[$i]*$ways[$total-$i];
		if($i==$total/2){
			$sum-=$ways[$i];
		}
	}
	foreach $coin (@coins){
		if($coin==$total){
			$sum++;
			last;
		}
	}
	push(@ways,$sum);
	print "$total: $sum\n";
}

#print "soln: " . $ways[200] . "\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";