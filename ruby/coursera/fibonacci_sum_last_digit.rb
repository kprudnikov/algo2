#!/usr/bin/env ruby

def fib_sum_last_digit(n)
  m = 10
  prev = 0
  current = 1
  i = 2

  sum = current
  loop do
    c = current
    current = prev + current
    prev = c

    current %= m
    prev %= m
    sum += current
    sum %= m

    break if i == n
    i += 1
  end if n > 1

  s = 0
  s = sum if n > 0
  s
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_sum_last_digit(n)}"
end
