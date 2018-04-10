#!/usr/bin/env ruby

# https://leetcode.com/explore/interview/card/facebook/5/round-1-phone-interview/262/
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  zeros = 0
  count = nums.count
  count.times do |i|
    k = count - i - 1
    if nums[k] == 0
      zeros += 1
      nums.delete_at(k)
      nums.push(0)
    end
  end
  nums
end
#
# puts move_zeroes([0,0,1]).to_s
# puts move_zeroes([0, 1, 0, 3, 12]).to_s

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  arr_a = a.chars
  count_a = arr_a.count
  arr_b = b.chars
  count_b = arr_b.count
  max = [arr_a.count, arr_b.count].max
  r = ''
  plus = 0
  max.times do |i|
    current_a = (count_a - i) > 0 ? arr_a[count_a - i - 1].to_i : 0
    current_b = (count_b - i) > 0 ? arr_b[count_b - i - 1].to_i : 0
    c = current_a + current_b + plus
    if c >= 2
      plus = 1
      c = c  - 2
    else
      plus = 0
    end
    r = c.to_s + r
  end
  r = plus.to_s + r if plus == 1

  r
end


# puts add_binary('1111', '1111')


# https://leetcode.com/explore/interview/card/facebook/5/round-1-phone-interview/288/
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  length = s.to_s.length
  return true if length == 0
  a = []
  h = {}
  (('a'..'z').to_a + (0..9).to_a).each {|v| h[v.to_s] = true}
  s.chars do |v|
    v.to_s.downcase!
    a.push(v) if h.has_key?(v)
  end
  palindrome?(a)
end
#
# puts is_palindrome('A man, a plan, a canal: Panama')
# puts is_palindrome("0P")

def palindrome?(a)
  count_a = a.count
  (count_a/2).times do |k|
    return false unless a[k] == a[count_a - 1 - k]
  end

  true
end



# https://leetcode.com/explore/interview/card/facebook/5/round-1-phone-interview/289/
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  length = s.to_s.length
  return true if length == 0
  a = s.chars
  return true if palindrome?(a)
  a.count.times do |i|
    b = a.clone
    b.delete_at(i)
    break if b[0] != b[a.count-2] && i > 0
    return true if palindrome?(b)
  end

  false
end

# https://leetcode.com/explore/interview/card/facebook/5/round-1-phone-interview/328/
# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  sum = 0
  current_arr = []
  min_arr = []
  nums.each do |i|
    current_arr.push(i)
    sum += i
    while sum > s
      break if sum - current_arr[0] < s
      past = current_arr.shift()
      sum -= past
    end

    if sum >= s
      min_arr = current_arr.clone if current_arr.count < min_arr.count || min_arr.count == 0
    end
  end

  min_arr.count > 0 ? min_arr.count : 0
end


# https://leetcode.com/explore/interview/card/facebook/5/round-1-phone-interview/297/