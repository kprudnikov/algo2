#!/usr/bin/env ruby


n = gets.strip.to_i
n.times do
  s1 = gets.strip
  s2 = gets.strip
  result = twoStrings(s1, s2)
  puts result
end