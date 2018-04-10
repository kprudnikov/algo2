#!/usr/bin/env ruby

# Given an array of numbers (1,2,3,8,0,2,2,0,10), move all 0s to the right end
# and all other numbers to the left while keeping relative order of non-zero numbers.
# Has to be linear in time and in-place.
def move_zero(a)
  a = a.to_a
  a.each_with_index do |v, k|
    if v == 0
      a.delete_at(k)
      a.push(0)
    end
  end
  a
end

# puts move_zero([1,2,3,8,0,2,2,0,10,0]).to_s




# https://leetcode.com/problems/two-sum/description/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  h = {}
  nums.each_with_index do |v, k|
    diff = target - v
    return [h[diff], k] if h.has_key?(diff)
    h[v] = k
  end

  nil
end

# puts two_sum([2, 7, 11, 15], 9)


# facebook
# Given an array of integers and a target number,
# find the two elements whose sum is closest to the target number.
def two_sum_closest(nums, target)
  h = {}
  min_number = nil
  min_diff_down = nil
  min_diff_up = nil
  nums.each do |v|
    diff = target - v
    return [diff, v] if h.has_key?(diff)
    h[diff] = v

    if diff > 0
      min_diff_down = diff if min_diff_down.nil? || min_diff_down > diff
    else
      min_diff_up = diff if min_diff_up.nil? || min_diff_up < diff
    end
    min_number = v if min_number.nil? || min_number > v
  end

  closest = nil
  closest_diff = nil
  nums.each do |v|
    next if v == h[min_diff_down]
    diff_c = (min_diff_down - v).abs
    if closest_diff.nil? || closest_diff > diff_c
      closest_diff = diff_c
      closest = v
    end
  end

  s1 = (h[min_diff_down] + closest - target).abs
  s2 = (h[min_diff_up] + min_number - target).abs
  puts [h[min_diff_down], closest].to_s, [h[min_diff_up], min_number].to_s
  if s1 < s2
    [h[min_diff_down], closest]
  else
    [h[min_diff_up], min_number]
  end
end

# puts two_sum_closest([4, 2, 7, 11, 25], 19).to_s
# puts "\n\n\n"
# puts two_sum_closest([4, 3, 7, 11, 25], 12).to_s


# 123 * 124
123 * 100 + 123 * 20 + 123 * 4


# https://leetcode.com/problems/integer-to-roman/description/
# @param {Integer} num
# @return {String}
def int_to_roman(num)
  out = ''
  # 1000
  thousands  = (num / 1000).to_i
  thousands.times { out += 'V' }

  out
end

print int_to_roman(3999) + "\n"

