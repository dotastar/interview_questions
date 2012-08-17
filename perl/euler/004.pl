#!/usr/local/bin/perl
#A palindromic number reads the same both ways.
#The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
#Find the largest palindrome made from the product of two 3-digit numbers.
$|=1;

my $large, $middle, $small, $number;

for($large=9;$large>0;$large--){
	for($middle=9;$middle>=0;$middle--){
		for($small=7;$small>=0;$small--){
			$number =  $large*100000+$middle*10000+$small*1000;
			$number += $small*100+$middle*10+$large;
			print "\rTesting $number";
			for($factor=999;$factor>=100;$factor--){
				if($number % $factor==0 && $number/$factor<1000 && $number/$factor>99){
					print "\n$factor x " . $number/$factor . " = $number\n";
					exit;
				}
			}
		}
	}
}