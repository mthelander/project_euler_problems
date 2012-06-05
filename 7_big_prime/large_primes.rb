=begin
 Project Euler problem #7
 http://projecteuler.net/problem=7
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
=end

class Fixnum
  def prime?
    max = (self**0.5).ceil
    2.upto(max) do |n|
      return false if self % n == 0
    end
    true
  end
end

def find_n_prime(target)
  f = Fiber.new do
    (1..1.0/0).each do |n|
      Fiber.yield n if n.prime?
    end
  end

  target.times.map { f.resume }.last
end

print find_n_prime(10001)
