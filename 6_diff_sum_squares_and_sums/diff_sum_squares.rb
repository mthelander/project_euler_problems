# Project Euler problem #6
# http://projecteuler.net/index.php?section=problems&id=6
# The sum of the squares of the first ten natural numbers is,
#   12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
#   (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def sum_squares(n)
  (1..n).inject { |sum, i| sum += i**2 }
end

def square_sums(n)
  ((n * (n + 1)) / 2)**2
end

print square_sums(100) - sum_squares(100)
