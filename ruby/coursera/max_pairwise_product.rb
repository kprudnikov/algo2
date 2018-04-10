#!/usr/bin/ruby

n = gets.strip.to_i
ar = gets.strip
max1 = 0
max2 = 0
ar.split(' ').each do |i|
    i = i.to_i
    if i > max1
      max2 = max1
      max1 = i
    elsif i > max2
      max2 =i
    end
end

puts max1 * max2