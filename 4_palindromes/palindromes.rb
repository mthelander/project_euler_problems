# Project Euler problem #4
# http://projecteuler.net/index.php?section=problems&id=4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

min, max, largest = 99, 999, 0
max.downto(min) do |i|
  max.downto(min) do |j|
    product = j * i
    if product > largest && product == product.to_s.reverse.to_i
      largest = j * i
    end
  end
end
print largest
