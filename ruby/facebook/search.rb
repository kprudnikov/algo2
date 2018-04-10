#!/usr/bin/env ruby

def search_binary(nums, target)
  left = 0
  right = nums.count - 1
  return -1 if right == -1
  until left == right
    k = ((left+right)/2).to_i
    return k if nums[k] == target
    if nums[k] > target
      right = k -1
    else
      left = k + 1
    end
  end

  nums[left] == target ? left : -1
end
# puts search_binary([1,2,3,4,5,6,7], 5)


# https://leetcode.com/explore/interview/card/facebook/54/sorting-and-searching-3/279/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.count - 1
  return -1 if right == -1

  while left < right
    k = ((left+right)/2).to_i
    return k if nums[k] == target

    # sorted correctly
    if nums[left] <= nums[k]
      # L <= T < M
      if nums[left] <= target && target < nums[k]
        right = k - 1
      else
        left = k + 1
      end
      # in-oder is here
    else
      # M < T <= R
      if nums[k] < target && target <= nums[right]
        left = k + 1
      else
        right = k -1
      end
    end
  end

  nums[left] == target ? left : -1
end
# puts search([3,4,5,6,7,1,2], 5)
# puts search([3,1], 3)
# puts search([3,1], 5)


def search_repeats(nums, target)
  left = 0
  right = nums.count - 1
  return false if right == -1
  while left < right
    m = ((left+right)/2).to_i
    return true if nums[m] == target

    left += 1 while nums[left] == nums[m] && left < m

    if nums[left] <= nums[m]
      if nums[left] <= target && target < nums[m]
        right = m - 1
      else
        left = m + 1
      end
    else
      if nums[m] < target && target <= nums[right]
        left = m + 1
      else
        right = m - 1
      end
    end
  end

  nums[left] == target
end
puts search_repeats([1, 1, 3, 1], 3)


# https://leetcode.com/explore/interview/card/facebook/54/sorting-and-searching-3/310/
# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  return intervals if intervals.count == 0
  h = {}
  a_start = []
  intervals.each do |v|
    a_start.push(v.start) unless h.key?(v.start)
    h[v.start] = v if h.key?(v.start) == false || h[v.start].end < v.end
  end
  current = nil
  c = a_start.count
  r = []
  a_start.sort!
  intervals = []

  last = nil
  a_start.each do |v|
    if last.nil? || h[v].end > last.end
      intervals.push(h[v])
      last = h[v]
    end

  end

  intervals.each_with_index do |v, k|
    current = v if current.nil?
    next_v = (k < (c-1)) ? intervals[k+1] : nil
    if next_v.nil? || v.end < next_v.start
      r.push(current)
      current = nil
    else
      current.end = next_v.end if next_v.end > current.end
    end
  end
  r.push(current) unless current.nil?

  r
end