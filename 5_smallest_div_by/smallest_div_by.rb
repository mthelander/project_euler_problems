# Project Euler problem #5
# http://projecteuler.net/index.php?section=problems&id=5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

range = (2..20)
print (2..range.inject(:*)).find { |i| range.all? { |j| i % j == 0 } }
