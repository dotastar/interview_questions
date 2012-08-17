#!/usr/local/bin/perl
#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143 ?
$|=1;

my $number = 600851475143;
open PRIMELIST, "primes1.txt" or die $!;
my @primes;
$i=1;

while($line = <PRIMELIST>){
	$line = trim($line);
	print "\rParsing line $i/15543";
	@line_primes = split(/[\s\n\r]+/,$line);
	@primes = (@primes,@line_primes);
	$i++;
}
print "...Done!\n";

for($i=1;$i<scalar(@primes);$i++){
	print "\rTrying " . $primes[-1*$i] . "             ";
	if($number % $primes[-1*$i]==0){
		print "\nSoln: " . $primes[-1*$i] . "\n";
		last;
	}
}

# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}
