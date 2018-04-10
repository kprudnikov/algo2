#!/usr/bin/env ruby

# https://leetcode.com/problems/count-primes/description/
# @param {Integer} n
# @return {Integer}
def count_primes(n)
  primes = []
  primes.push(1) if n > 0
  primes.push(2) if n > 1
  h = {}
  (3..primes).each do |k|
    next if k > 2 && k%2 == 0
    # if is_prime(k)
  end

  primes
end

def is_prime(n)
  return true if n <= 2
  max_d = Math.sqrt(n).to_i
  (2..max_d).each do |k|
    return true if n % k == 0
  end
end



# https://leetcode.com/problems/happy-number/description/
# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  return true if n == 1
  used = {}
  until n == 1
    n = is_happy_sum(n)
    return false if used.key?(n)
    used[n] = true
  end
  true
end

def is_happy_sum(n)
  s = 0
  n.to_s.each_char do |i|
    s += i.to_i ** 2
  end
  s.to_i
end