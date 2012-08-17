<?php

class Node {
	public $left;
	public $right;
	
	function __construct($left = null, $right = null) {
		$this->left = $left;
		$this->right = $right;
	}
}

function dfs_recursive($root) {
	if ($root) {
		return 1 + max(dfs_recursive($root->left), dfs_recursive($root->right));
	} else {
		return 0;
	}
}

function dfs_iterative($root) {
	return 0;
}

$root = new Node();