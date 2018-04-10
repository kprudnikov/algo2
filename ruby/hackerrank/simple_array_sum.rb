#!/bin/ruby

def solve(n, ar)
  sum = 0
  ar.each do |i|
    sum += i
  end
  sum
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
result = simpleArraySum(n, ar)
puts result
