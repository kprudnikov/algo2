#!/usr/bin/env ruby
@out = []

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

# https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/266/
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  is_valid_bst_min_max(root, Integer::MIN, Integer::MAX)
end

def is_valid_bst_min_max(root, min, max)
  return true if root.nil?
  return false if root.left.nil? == false && (root.val <= root.left.val || root.left.val >= max)
  return false if root.right.nil? == false && (root.val >= root.right.val || root.right.val <= min)
  return false if root.val >= max || root.val <= min

  is_valid_bst_min_max(root.left, min, root.val) && is_valid_bst_min_max(root.right, root.val, max)
end


# https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/306/
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  inoder_direction(p) == inoder_direction(q)
end

# @param {TreeNode} root
# @return {Array}
def inoder_direction(root, a = [], d = '')
  return [] if root.nil?
  inoder_direction(root.left, a, 'l')
  a.push(root.val.to_s + d)
  inoder_direction(root.right, a, 'r')

  a
end

# https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/280/
# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  @out = []
  path(root)
  @out
end

def path(root, p = [])
  return if root.nil?

  p.push(root.val)

  if root.left.nil? && root.right.nil?
    @out.push(p.join('->').to_s) if p.count
    return
  end

  path(root.left, p.clone)
  path(root.right, p.clone)
end

# https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/291/
# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
  @max_d = 0
  height(root)
  @max_d
end


def height(root)
  return -1 if root.nil?

  h_l = 1 + height(root.left)
  h_r = 1 + height(root.right)
  h = [h_l, h_r].max
  d = h_l + h_r
  @max_d = d if d > @max_d

  h
end


# https://leetcode.com/explore/interview/card/facebook/52/trees-and-graphs/298/
# @param {TreeNode} root
# @return {Integer[][]}
def vertical_order(root)
  return [] if root.nil?
  @min = 0
  @max = 0
  find_min_max(root, 0)
  @h = {}
  (@max-@min+1).times do |i|
    @h[@min + i] = {}
  end

  set_vertical(root, 0, 0)
  r = []

  @h.each_value do |h|
    h = h.sort.to_h
    a_out = []
    h.each_value do |i_a|
      i_a.each {|i| a_out.push(i)}
    end
    r.push(a_out) if a_out.count
  end

  r
end

def set_vertical(root, k, l)
  return if root.nil?
  v = root.val
  @h[k][l] = [] unless @h[k].has_key?(l)
  @h[k][l].push(v)
  set_vertical(root.left, k-1, l+1)
  set_vertical(root.right, k+1, l+1)
end

# @param {TreeNode} root
# @return {Integer}
def find_min_max(root, position)
  return position if root.nil?
  p_l = position
  p_r = position
  p_l = find_min_max(root.left, position - 1) unless root.left.nil?
  p_r = find_min_max(root.right, position + 1) unless root.right.nil?
  @min = p_l if p_l < @min
  @max = p_r if p_r > @max

  position
end


# https://leetcode.com/explore/interview/card/top-interview-questions-easy/94/trees/628/
# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  @level_h = {}
  level_order_traversal(root, 0)
  r = []
  @level_h.each_value {|a| r.push(a)}

  r
end

def level_order_traversal(root, level)
  return nil if root.nil?
  @level_h[level] = [] unless @level_h.key?(level)
  @level_h[level].push(root.val)
  level_order_traversal(root.left, level+1)
  level_order_traversal(root.right, level+1)
end

# https://leetcode.com/explore/interview/card/facebook/6/round-2-onsite-interview/322/
# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  return nil if root.nil?
  arr = preorder_traversal(root)
  c = arr.count
  set_node(arr, 0, c, root)
end

def set_node(arr, k, c, root)
  root.left = nil
  root.val = arr[k]
  if k+1 < c
    root.right = TreeNode.new(nil)
    set_node(arr, k+1, c, root.right)
  end
end

def preorder_traversal(root, arr = [])
  return [] if root.nil?
  arr.push(root.val)
  preorder_traversal(root.left, arr)
  preorder_traversal(root.right, arr)

  arr
end