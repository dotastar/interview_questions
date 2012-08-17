# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
num = 2520
primeCount = [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

for i in range(4, len(primeCount)):
	num = i
	for j in range(2, num + 1):
		numDivisible = 0
		while num % j == 0:
			numDivisible = numDivisible + 1
			num = num / j
			
		if primeCount[j] < numDivisible:
			primeCount[j] = numDivisible
		elif j == num:
			primeCount[j] = primeCount[j] + 1

lcd = 1
for i in range(2, len(primeCount)):
	for j in range(0, primeCount[i]):
		lcd = lcd * i
		
print lcd