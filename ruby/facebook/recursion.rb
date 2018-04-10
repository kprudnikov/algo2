#!/usr/bin/env ruby

# https://leetcode.com/explore/interview/card/facebook/53/recursion-3/278/
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  res = [[]]
  nums.each do |n|
    res2 = res.clone
    res2.each do |a|
      a2 = a.clone
      a2.push(n)
      res.push(a2)
    end
  end

  res
end

puts subsets([1, 2, 3]).to_s

# https://leetcode.com/explore/interview/card/facebook/53/recursion-3/292/
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return nums unless nums.count
  res = [
      [nums[0]]
  ]
  c = nums.count
  (1..(c-1)).each do |i|
    n = nums[i]
    res2 = []
    res.each do |a|
      a_work = a.clone
      (a.count.times+1).times do |k|

      end
    end
  end
end