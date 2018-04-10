#!/usr/bin/env ruby

# https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  h = {}
  nums.each {|i| h[i] = true}
  out = []
  h.each_key {|i| out.push(i)}
  out
end

def remove_duplicates2(nums)
  prev = nil
  k = 0
  nums.each do |i|
    if !prev.nil? && prev != i
      k += 1
    end
    prev = i
  end
  k + 1
end

puts remove_duplicates2([1, 1, 2]).to_s
# puts remove_duplicates2([1, 1, 2, 3, 3, 3, 4, 4, 5, 6, 6]).to_s