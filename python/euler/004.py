# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.
largestPalindrome = 0

for i in range(100,1000):
	for j in range(100, 1000):
		num = i * j
		numStr = str(num)
		if numStr == numStr[::-1]:
			if num > largestPalindrome:
				largestPalindrome = num
				
print largestPalindrome