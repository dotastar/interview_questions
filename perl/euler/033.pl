#The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
#We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
#There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
#If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$prodNumerator = 1;
$prodDenom = 1;

for($cancelled=1;$cancelled<=9;$cancelled++){
	for($a=1;$a<=9;$a++){
		for($b=1;$b<=9;$b++){
			if($a!=$b){
				#xa/xb
				#Will never have results
				
				#xa/bx
				$numerator = $cancelled*10+$a;
				$denominator = $cancelled+$b*10;
				if($numerator/$denominator<1 && $numerator/$denominator == $a/$b){
					#print "$numerator/$denominator\n";
					$prodNumerator*=$a;
					$prodDenom*=$b;
				}
				#ax/xb
				$numerator = $cancelled+$a*10;
				$denominator = $cancelled*10+$b;
				if($numerator/$denominator<1 && $numerator/$denominator == $a/$b){
					#print "$numerator/$denominator\n";
					$prodNumerator*=$a;
					$prodDenom*=$b;
				}
				#ax/bx
				#Will never have results
			}
		}
	}
}

print "$prodNumerator/$prodDenom\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";