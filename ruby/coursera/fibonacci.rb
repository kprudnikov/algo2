#!/usr/bin/env ruby

def calc_fib(n)
  c = Array.new
  c.push 0
  c.push 1
  i = 2
  loop do
    num = c[i-1] + c[i-2]
    c.push num
    break if i == n
    i += 1
  end

  c[n]
end


if __FILE__ == $0
  n = gets.to_i
  puts "#{calc_fib(n)}"
end
