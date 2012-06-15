# Project Euler problem #9
# http://projecteuler.net/problem=9
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#
# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def find_pythagorean_triplets
  1.upto(500) do |a|
    (a + 1).upto(501) do |b|
      c = Math.sqrt(a**2 + b**2)
      return [a, b, c.to_i] if a + b + c == 1000
    end
  end
end

puts find_pythagorean_triplets.inject(&:*)
