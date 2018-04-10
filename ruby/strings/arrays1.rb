#!/usr/bin/env ruby

def matrix_turn(a)
  a = a.to_a
  h = a.count
  w = a[0].count
  ar = []
  # Array.new(4) { Hash.new } #=> [{}, {}, {}, {}]
  h.times do |i|
    w.times do |j|
      ar[i] = [] unless ar[i]
      ar[i][j] = a[j][w - 1 - i] # 90 right
      # ar[i][j] = a[h-1-i][w-1-j] # 180
      # ar[i][j] = a[h-1-j][i] # 90 left
    end
  end

  w.times do |i|
    s = ''
    h.times do |j|
      s += ar[i][j].to_s + ' '
    end
    puts s
  end
end

a = [
  (1..5).to_a,
  (6..10).to_a,
  (11..15).to_a,
  (16..20).to_a,
  (21..25).to_a
]

# matrix_turn a


def max_diff(a)
  min = a[0]
  max = a[0]
  a.each do |v|
    min = v if min > v
    max = v if max < v
  end

  max - min
end

# https://leetcode.com/problems/range-addition/description/
# @param {Integer} length
# @param {Integer[][]} updates
# @return {Integer[]}
def get_modified_array(length, updates)
  arr = []
  length.times { |i| arr.push(0)}

  h = {}
  updates.each do |op|
    k = op[0].to_s + '--' + op[1].to_s
    if h.key?(k)
      h[k][2] = h[k][2] + op[2]
    else
      h[k] = op
    end
  end

  h.each_value do |op|
    start = op[0]
    finish = op[1]
    while start <= finish
      arr[start] += op[2]
      start += 1
    end
  end

  arr
end