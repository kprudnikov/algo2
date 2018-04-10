#!/usr/bin/ruby

input = $stdin.read
numbers = Array.new

input.split.each do |item|
  numbers.push item.to_i
end

puts numbers[0] + numbers[1] if numbers.length > 1