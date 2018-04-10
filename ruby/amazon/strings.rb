#!/usr/bin/env ruby

# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/489/
# @param {String} s
# @return {String}
def longest_palindrome(s)
  sub = []
  s.to_s.each_char do |v|

  end
end

def palindrome?(a)
  count_a = a.count
  (count_a/2).times do |k|
    return false unless a[k] == a[count_a - 1 - k]
  end

  true
end