# Project Euler problem #3
# http://projecteuler.net/index.php?section=problems&id=3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

target = 600851475143

def is_prime?(i)
  2.upto(Math.sqrt(i).floor) do |j|
    return false if (i % j) == 0
  end
  true
end

Math.sqrt(target).floor.downto(2) do |i|
  if ((target % i) == 0) && is_prime?(i)
    print i
    break
  end
end
