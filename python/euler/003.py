# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143
import array

num = 600851475143
primes = [2]
largestPrime = 0

i = 3
while i <= num:
	isPrime = 1;
	for j in primes:
		if i % j == 0:
			isPrime = 0
			break
			
	if isPrime == 1:
		primes.append(i)
		if num % i == 0:
			num = num/i
			largestPrime = i
	
	i =  i + 1
	
print largestPrime