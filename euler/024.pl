# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
use Time::HiRes qw( gettimeofday tv_interval );
$|=1;
$t0 = [gettimeofday];

@digits = (0,1,2,3,4,5,6,7,8,9);
$permutationCount = 0;

permeate(0);

# for($k=0;$k<3;$k++){
	# @temp_k = @digits;
	# for($j=0;$j<2;$j++){
		# @temp_j = @digits;
		# for($i=0;$i<1;$i++){
			# swap(8,9+$i);
			# print "@digits\n";
			# $permutation++;
		# }
		# @digits = @temp_j;
		# swap(7,8+$j);
		# print "@digits\n";
		# $permutation++;
	# }
	# @digits = @temp_k;
	# swap(6,7+$k);
	# print "@digits\n";
	# $permutation++;
# }

sub swap{
	($idx1,$idx2) = @_;
	$temp = $digits[$idx1];
	$digits[$idx1] = $digits[$idx2];
	$digits[$idx2] = $temp;
}

sub permeate{
	my $index = shift;
	
	if($index==8){
		incPermutationCount();
		swap(8,9);
		incPermutationCount();
	} else {
		for(my $i=0;$i<=9-$index;$i++){
			swap($index,$index+$i);
			
			my @temp = @digits;
			permeate($index+1);
			@digits = @temp;
		}
	}
}
		
sub incPermutationCount{
	++$permutationCount;
	#print "\rCalculating Permutation $permutationCount";
	if($permutationCount==1000000){
		print "Soln: @digits\n";
		print "Elapsed Time: " . tv_interval ( $t0 ) . "\n";
		exit;
	}
}