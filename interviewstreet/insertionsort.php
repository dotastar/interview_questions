<?php

$numTestCases = trim(fgets(STDIN));
$output = '';

for ($i = 0; $i < $numTestCases; $i++) {
	$numSwaps = 0;
	$numElements = trim(fgets(STDIN));
	$elements = explode(' ', trim(fgets(STDIN)));
	
	for($j = 1; $j < $numElements; $j++) {
		$k = $j;
		
		while ($k > 0 && $elements[$k] < $elements[$k - 1]) {
			$temp = $elements[$k - 1];
			$elements[$k - 1] = $elements[$k];
			$elements[$k] = $temp;
			
			$k -= 1;
			$numSwaps++;
		}
	}
	
	$output .= $numSwaps . "\n";
}

echo $output;