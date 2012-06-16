=begin
  Project Euler #10
  http://projecteuler.net/problem=10

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
=end

=begin
# Nicer, but too slow...

def all_primes(target)
  primes = (2..target).to_a
  primes.each do |prime|
    primes.delete_if do |n|
      n > prime && n % prime == 0
    end
  end
end
=end

def all_primes(target)
  primes = (2..target).to_a
  primes.each_with_index do |n, i|
    next if n.nil?
    (i+n..target-2).step(n) do |j|
      primes[j] = nil if j < primes.size
    end
  end

  primes.compact
end

puts all_primes(2_000_000).reduce(&:+)
