# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# 
# What is the 10001st prime number?
primes = [2, 3, 5, 7, 11, 13]
count = 6
num = 15

while 1:
	isPrime = 1
	for prime in primes:
		if num % prime == 0:
			isPrime = 0
			break
	
	if isPrime == 1:
		primes.append(num)
		count = count + 1
		if count == 10001:
			print num
			exit()
	
	num = num+2
	