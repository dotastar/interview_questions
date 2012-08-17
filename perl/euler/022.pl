# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?
use Math::BigInt;
use List::Util qw(sum);
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

$sum = Math::BigInt->bzero();
$nameCount = 1;

open NAMES, "names.txt" or die $!;

while($line = <NAMES>){
	$line=~s/\n|\r|\"//g;
	@names = (@names,split(/,/,$line));
}
@names = sort(@names);

foreach $name (@names){
	$nameScore=0;
	@letters = split(//,$name);
	foreach $letter(@letters){
		$nameScore+=ord($letter)-64;
	}
	$sum+=$nameScore*$nameCount;
	$nameCount++;
	print "$name: $nameScore\n";
}

print "Total: $sum\n";
print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";