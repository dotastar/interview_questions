<?php

$numTestCases = trim(fgets(STDIN));
$output = '';

for ($i = 0; $i < $numTestCases; $i++) {
	$graph = explode(' ', trim(fgets(STDIN)));
	
	$nodes = $graph[0];
	$edges = $graph[1];
	
	$minNodes = 1;
	$factorial = 1;
	
	while ($factorial < $edges/$nodes) {
		$minNodes++;
		$factorial *= $minNodes;
	}
	
	$output .= $minNodes . "\n";
}

echo $output;