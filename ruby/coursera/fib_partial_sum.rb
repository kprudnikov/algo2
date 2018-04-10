#!/usr/bin/env ruby
# by Andronik Ordian

def fib_partial_sum(m, n)
  mod = 10
  prev = 0
  current = 1
  i = 2

  sum = 0
  sum = current if n >= 1
  loop do
    c = current
    current = prev + current
    prev = c

    current %= mod
    prev %= mod

    if i >= m
      sum += current
      sum %= mod
    end

    break if i == n
    i += 1
  end if n > 1

  sum
end

if __FILE__ == $0
  m, n = gets.split().map(&:to_i)
  puts "#{fib_partial_sum(m, n)}"
end
