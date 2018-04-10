#!/usr/bin/env ruby

def fib_last_digit(n, m)
  prev = 0
  current = 1
  i = 2

  while i < n
    i += 1
  end if n > 1

  num = 0
  num = current if n > 0
  num % m
end

if __FILE__ == $0
  input = gets.split
  n = input[0].to_i
  m = input[1].to_i
  puts "#{fib_last_digit(n, m)}"
end

puts 3 % 4
puts 3 % 104