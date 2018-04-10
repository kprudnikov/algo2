#!/usr/bin/env ruby

def camelcase(s)
  c = 1
  s.chars.each do |v|
    c += 1 if v.to_s.downcase != v.to_s
  end
  c
end
#
# puts camelcase 'saveChangesInTheEditor'
# puts camelcase 'save'


def two_charaters(s)
  h = {}
  a = s.chars
  a.each do |v|
     h[v] = true
  end

  l_max = 0
  h.keys.each do |v1|
    h.keys.each do  |v2|
      next if v1 == v2

      last = nil
      l = 0
      s = ''
      a.each do |v|
        next if v != v1 && v != v2
        if !last.nil? && last == v
          l = 0
          break
        end
        l += 1
        last = v
        s += v
      end
      l_max = l if l > l_max
    end
  end
  l_max
end

#
# puts two_charaters('beabeefeab')
# puts two_charaters('pvmaigytciycvjdhovwiouxxylkxjjyzrcdrbmokyqvsradegswrezhtdyrsyhg')

# https://www.hackerrank.com/challenges/separate-the-numbers/problem
def separate_numbers(s)
  a = s.to_s.chars
  a.count.times do |n|
    break if 2 * n + 1 > a.count
    first = ''
    (n + 1).times do |i|
      first += a[0 + i].to_s
    end

    cn = first.length
    current_s = ''
    k = cn
    prev = first.to_i

    loop do
      break if k == a.count
      current_s += a[k]
      current = current_s.to_i

      if (current - 1) < prev
        break if current_s == '0'
        k += 1
        next
      end

      break if (current - 1) > prev

      if (current - 1) == prev
        return 'YES ' + first.to_s if (k + 1) == a.count
        prev = current
        current_s = ''
        k += 1
        next
      end
    end
  end

  'NO'
end

# puts separate_numbers('1234')
# puts separate_numbers('91011')
# puts separate_numbers('99100')
# puts separate_numbers('101103')
# puts separate_numbers('010203')
# puts separate_numbers('13')
# puts separate_numbers('1')



# https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem
def is_valid(s)
  hash = {}
  s.to_s.chars.each do |l|
    hash[l] = 0 unless hash.has_key?(l)
    hash[l] += 1
  end

  n_hash = {}
  hash.values.each do |v|
    n_hash[v] = 0 unless n_hash.has_key?(v)
    n_hash[v] += 1
  end

  return 'NO' if n_hash.count > 2
  return 'YES' if n_hash.count < 2

  min_repeated = n_hash.first[0]
  max_repeated = min_repeated
  n_hash.each_key do |k|
    min_repeated = k if k < min_repeated
    max_repeated = k if k > max_repeated
  end

  return 'YES' if n_hash[min_repeated] == 1
  return 'YES' if n_hash[max_repeated] == 1 && (max_repeated - min_repeated) == 1

  'NO'
end

# puts is_valid('aabbccd')
# puts is_valid('hfchdkkbfifgbgebfaahijchgeeeiagkadjfcbekbdaifchkjfejckbiiihegacfbchdihkgbkbddgaefhkdgccjejjaajgijdkd')


# https://www.hackerrank.com/challenges/two-strings/problem
def two_strings(s1, s2)
  h = {}
  s1.to_s.each_char do |l|
    h[l] = true
  end
  s2.to_s.each_char do |l|
    return 'YES' if h.has_key?(l)
  end

  'NO'
end

# puts two_strings('hello', 'world')
# puts two_strings('hi', 'world')


# https://www.hackerrank.com/challenges/funny-string/problem
def funny_string(s)
  a = s.to_s.chars
  c = a.count

  h = {}
  ('a'..'z').each_with_index do |l, i|
    h[l] = i
  end

  t = (c.to_f / 2).round
  t.times do |i|
    k1 = h[a[i]] - h[a[i + 1]]
    k2 = h[a[c - i - 1]] - h[a[c - i - 2]]

    return 'Not Funny' unless k1.abs == k2.abs
  end

  'Funny'
end
#
# puts funny_string 'acxz'
# puts funny_string 'bcxz'
# puts funny_string 'ivvkxq'
# puts funny_string 'ivvkx'


# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
# @param {String} s
def length_of_longest_substring(s)
  max = 0
  current_hash = {}
  current_arr = []
  current_count = 0
  s.to_s.each_char do |v|
    while current_hash.has_key?(v)
      first = current_arr[0]
      current_arr.delete_at(0)
      current_hash.delete(first)
      current_count -= 1
    end

    current_hash[v] = true
    current_arr.push(v)
    current_count += 1
    if current_count > max
      max = current_count
    end
  end

  max
end

# puts length_of_longest_substring('abccabcbb')
# puts length_of_longest_substring('bbbb')

# facebook
# given and array of positive integers and another integer
# find whether there is a consecutive range in the array,
# so that the sum of integers in the range is equal to the given number
# @param {Array} a
# @param {int} e
def int_range?(a, e)
  current_arr = []
  current_sum = 0
  a.each do |v|
    until current_sum < e
      first = current_arr[0]
      current_arr.delete_at(0)
      current_sum -= first
    end
    current_sum += v
    return true if current_sum == e
    current_arr.push(v)
  end

  false
end
#
# puts int_range?([1,2,3,4,5,6,7,3,2,5,77,7,2], 16)
# puts int_range?([1,2,3,4,5,6,7,3,2,5,77,7,2], 15)
# puts int_range?([1,2,3,4,5,6,7,3,2,5,77,7,2], 123)


# https://leetcode.com/contest/weekly-contest-75/problems/rotate-string/
# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  l = b.to_s.length
  l.times do
    b = b.slice!(1, l-1) + b[0]
    return true if a == b
  end

  false
end

# puts rotate_string('cdeab', 'abcde')


# https://leetcode.com/problems/longest-palindromic-substring/description/
# @param {String} s
# @return {String}
def longest_palindrome(s)
  res = ''
  curr_l = 0
  l = s.to_s.length
  l.times do |i|
    if polindrom?(s, i-curr_l-1, i)
      res = s.slice(i-curr_l-1,i+1)
      curr_l += 2
    elsif polindrom?(s, i-curr_l, i)
      res = s.slice(i-curr_l,i+1)
      curr_l += 1
    end
  end

  res
end
#
# def polindrom?(str, s, l)
#   return false if l == 0
#   sub = str.to_s.slice!(s, l)
#   return false if sub.nil?
#   a = sub.chars
#   # puts sub
#   return true if a.count == 1
#   l = a.count
#   (l/2).times do |i|
#     return false if a[i] != a[l-1-i]
#   end
#
#   true
# end


# puts longest_palindrome('babad')


# @param {String} s
# @param {Integer} num_rows
# @return {String}
# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  size = num_rows + (num_rows/2).to_i
  a = []
  num_rows.times do |k|
    a[k] = []
  end
  s.to_s.chars.each_with_index do |v, i|
    k = (i + 1) % size
    k = size if k == 0

    if k <= num_rows
      n = k -1
    else
      n = (k - num_rows) * 2 - 1 - 1 * ((num_rows+1)%2).to_i
    end
    a[n].push(v)
  end

  out = ''
  a.each do |l|
    l.each do |v|
      out += v
    end
  end

  out
end
#
# puts convert('ABC', 2)
# puts convert('ABCD', 2)
# puts convert('PAYPALISHIRING', 3)


# https://leetcode.com/problems/3sum/description/
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  h = {}
  nums.each  do |i|
    if h.key?(i)
      h[i] += 1
    else
      h[i] = 1
    end
  end

  r = {}
  h.each_key do |v1|
    h.each_key do |v2|
      s = v1 + v2
      next if v1 == v2 && h[v1] < 2
      candidate = 0 - s
      if h.key?(candidate)
        next if v1 == candidate && h[v1] < 2
        next if v2 == candidate && h[v2] < 2
        next if v2 == v1 && v1 == candidate && h[v2] < 3
        s = [v1, v2, candidate].sort!.to_s
        r[s] = [v1, v2, candidate].sort!
      end
    end
  end

  out = []
  r.each_value {|v| out.push(v)}
  out
end

# puts three_sum [-1, 0, 1, 2, -1, -4]

# https://leetcode.com/problems/3sum-closest/description/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  n = nums.to_a.sort
  size = n.size
  closest = nil
  n.each_with_index do |v, i|
    j = i + 1
    k = size - 1

    while k > j
      r = n[i] + n[j] + n[k]
      return r if r == target

      if closest.nil? || (r-target).abs < (closest-target).abs
        closest = r
      end

      if r > target
        k -= 1
      else
        j += 1
      end
    end
  end

  closest
end

# puts three_sum_closest([0,1,2], 3)
# puts three_sum_closest([-1, 0, 1, 2, -1, -4], -1)
def letter_combinations(digits)
  out = []
  digits.to_s.each_char do |i|
    out = add_l(out, i)
  end
  out
end

def letter_to_arr(l)
  l = l.to_s
  if l == '2'
    return ['a', 'b', 'c']
  end
  if l == '3'
    return ['d', 'e', 'f']
  end
  if l == '4'
    return ['g', 'h', 'i']
  end
  if l == '5'
    return ['j', 'k', 'l']
  end
  if l == '6'
    return ['m', 'n', 'o']
  end
  if l == '7'
    return ['p', 'q', 'r', 's']
  end
  if l == '8'
    return ['t', 'u', 'v']
  end
  if l == '9'
    return ['w', 'x', 'y', 'z']
  end
  if l == '0'
    return ['_']
  end
  []
end

def add_l(a, l)
  b = []
  l_a = letter_to_arr(l)
  return a if l_a.count < 1
  return l_a if a.count < 1
  a.each do |v|
    l_a.each do |nl|
      b.push(v + nl)
    end
  end

  b
end
# puts letter_combinations('234')


# https://leetcode.com/problems/decode-ways/description/
# @param {String} s
# @return {Integer}
def num_decodings(s)
  a = s.to_s.chars
  l = a.count
  return 0 if l > 0 && a[0].to_i == 0
  i = 0
  prev_1 = 0
  prev_2 = 0
  max_n = 0
  while i < l do
    i += 1
    if i == 1
      max_n = 1
    elsif i == 2
      max_n = 2
    else
      if i == 3
        prev_1 = 2
        prev_2 = 1
      end
      max_n = prev_1 + prev_2
      prev_2 = prev_1
      prev_1 = max_n
    end
  end

  return 0 if max_n == 0

  invalids = 0
  l.times do |i|
    invalids += num_invalid?(a[i])
    invalids += 1 if a[i].to_s == '0' && i+1 == l
    if i > 0
      if a[i-1].to_s == '0'
        invalids += 1
        next
      end
      n = (a[i-1].to_s + a[i].to_s)
      return 0 if n == '00'
      invalids += num_invalid?(n.to_i)
    end
  end

  return 0 if invalids > max_n

  max_n - invalids
end

def num_invalid?(n)
  n = n.to_i
  min = 1
  max = 26
  n < min || n > max ? 1 : 0
end
#
# puts num_decodings('110')
# puts num_decodings('101')


# https://leetcode.com/problems/climbing-stairs/description/
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2
  a = [1, 2]
  (n-2).times do |i|
    first = a[1]
    a[1] = a[0] + a[1]
    a[0] = first
  end

  a[1]
end
#
# puts climb_stairs(3)
# puts climb_stairs(4)
# puts climb_stairs(5)
# puts climb_stairs(6)


# https://leetcode.com/problems/single-number/description/
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  h = {}
  nums.each do |v|
    if h.key?(v)
      h.delete(v)
    else
      h[v] = true
    end
  end

  h.each_key {|v| return v}
end

# https://leetcode.com/problems/isomorphic-strings/description/
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  arr_from_hash_from_string(s) == arr_from_hash_from_string(t)
end

def arr_from_hash_from_string(s)
  h = {}
  k = 0
  s.each_char do |v|
    if h.key?(v)
      h[v].push(k)
    else
      h[v] = [k]
    end
    k += 1
  end

  r = []
  h.each_value {|v| r.push(v)}

  r
end