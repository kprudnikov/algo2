#!/usr/bin/env ruby

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  i = m
  j = n
  while i > 0 && j > 0
    if nums1[i-1] <= nums2[j-1]
      nums1[i+j-1] = nums2[j-1]
      j -= 1
    else
      nums1[i+j-1] = nums1[i-1]
      i -= 1
    end
  end


  j.times do |k|
    nums1[k] = nums2[k]
  end

  nums1
end

puts merge([0], 0, [1], 1).to_s
puts merge([1,0], 1, [2], 1).to_s
puts merge([1,2,3,0,0,0], 3, [2,5,6], 3).to_s
puts merge([3,5,6,0,0,0], 3, [1,2,2], 3).to_s