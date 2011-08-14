# Project Euler problem #1
# http://projecteuler.net/index.php?section=problems&id=1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

max = 999
sum_multiples = -> n { n * ((max / n * (max / n + 1)) / 2) }
print sum_multiples[3] + sum_multiples[5] - sum_multiples[15]
