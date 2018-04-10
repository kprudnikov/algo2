#!/usr/bin/env ruby
# CATALAN NUMBER
# https://leetcode.com/problems/unique-binary-search-trees-ii/description/
# https://www.quora.com/Given-n-how-many-structurally-unique-BSTs-binary-search-trees-that-store-values-1-to-n-are-there-How-would-I-come-up-with-the-solution-Can-you-explain-the-thought-process-that-leads-to-the-solution
# sum(D(i-1)*D(n-i))
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {Array} a
# @return {Array}
def inoder(root, a = [])
  return [] if root.nil?
  inoder(root.left, a)
  a.push(root.val)
  inoder(root.right, a)

  a
end

def inoder_op(root, a = [])
  return [] if root.nil?
  inoder_op(root.right, a)
  a.push(root.val)
  inoder_op(root.left, a)

  a
end

def postorder(root, a = [])
  return [] if root.nil?
  postorder(root.left, a)
  postorder(root.right, a)
  a.push(root.val)

  a
end

def preorder(root, a = [])
  return [] if root.nil?
  a.push(root.val)
  postorder(root.left, a)
  postorder(root.right, a)

  a
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  a = []
  a[0] = 1
  a[1] = 1
  return 1 if n < 2

  (2..n).each do |i|
    a[i] = 0
    (1..i).each do |j|
      a[i] += a[j-1] * a[i-j]
    end
  end
  a[n]
end
#
# puts generate_trees(1)
# puts generate_trees(2)
# puts generate_trees(3)


# https://leetcode.com/problems/unique-binary-search-trees/description/
# @param {Integer} n
# @return {Integer}
def num_trees(n)
  a = []
  a[0] = 1
  a[1] = 1
  return 1 if n < 2

  (2..n).each do |i|
    a[i] = 0
    (1..i).each do |j|
      a[i] += a[j-1] * a[i-j]
    end
  end
  a[n]
end


# https://leetcode.com/problems/find-bottom-left-tree-value/description/
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

@max_level_left = 0
@max_left = nil

# @param {TreeNode} root
# @return {Integer}
def find_bottom_left_value(root)
  @max_left = root.val
  @max_level_left = 0
  find_bottom_left_value_travel(root, 0)

  @max_left
end

# @param {TreeNode} node
# @param {level} int
def find_bottom_left_value_travel(node, level = 0)
  return if node.nil?
  if level > @max_level_left
    @max_level_left = level
    @max_left = node.val
  end
  find_bottom_left_value_travel(node.left, level + 1)
  find_bottom_left_value_travel(node.right, level + 1)
end


# https://leetcode.com/problems/balanced-binary-tree/description/
# bottom-up approach
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  return true if root.nil?
  max_level(root) != -1
end

def max_level(node)
  return 0 if node.nil?
  left = max_level(node.left)
  return -1 if left == -1

  right = max_level(node.right)
  return -1 if right == -1

  abs = (left-right).abs
  return -1 if abs > 1

  [left, right].max + 1
end


# https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
# https://www.geeksforgeeks.org/construct-tree-from-given-inorder-and-preorder-traversal/
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree_pi(preorder, inorder)
  return nil if preorder.count == 0
  root = preorder.shift
  inorder_left = []
  inorder_right = []
  preorder_left = []
  preorder_right = []
  to_left = true
  inorder.each do |v|
    if v == root
      to_left = false
    else
      inorder_left.push(v) if to_left
      inorder_right.push(v) unless to_left
    end
  end
  count_left = inorder_left.count
  count_right = inorder_right.count
  count_left.times do |v|
    preorder_left.push(preorder[v])
  end
  count_right.times do |v|
    preorder_right.push(preorder[v+count_left])
  end

  node = TreeNode.new(root)
  node.left = build_tree_pi(preorder_left, inorder_left)
  node.right = build_tree_pi(preorder_right, inorder_right)

  node
end

# tree = build_pi_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])

# https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/
# https://www.geeksforgeeks.org/construct-a-binary-tree-from-postorder-and-inorder/
# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree_ip(inorder, postorder)
  return nil if postorder.count == 0
  root = postorder.pop
  inorder_left = []
  inorder_right = []
  postorder_left = []
  postorder_right = []
  to_left = true
  inorder.each do |v|
    if v == root
      to_left = false
    else
      inorder_left.push(v) if to_left
      inorder_right.push(v) unless to_left
    end
  end
  count_left = inorder_left.count
  count_right = inorder_right.count
  count_left.times do |v|
    postorder_left.push(postorder[v])
  end
  count_right.times do |v|
    postorder_right.push(postorder[v+count_left])
  end


  node = TreeNode.new(root)
  node.left = build_tree_ip(inorder_left, postorder_left)
  node.right = build_tree_ip(inorder_right, postorder_right)

  node
end

# tree = build_tree_ip([9,3,15,20,7], [9,15,7,20,3])
# puts tree.val
# puts tree.right.left.val
# puts tree.right.right.val


# https://leetcode.com/problems/same-tree/description/
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  inoder_direction(p) == inoder_direction(q)
end

def inoder_direction(root, a = [], d = '')
  return [] if root.nil?
  inoder_direction(root.left, a, 'l')
  a.push(root.val.to_s + d)
  inoder_direction(root.right, a, 'r')

  a
end

# p = TreeNode.new(1)
# p.left = TreeNode.new(1)
#
# q = TreeNode.new(1)
# q.left = TreeNode.new(1)
#
# puts is_same_tree(p, q)
#


# https://leetcode.com/problems/binary-tree-postorder-traversal/description/
# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  postorder(root, [])
end





# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/description/
# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)

end

def preorder_list(root, a = [])
  return [] if root.nil?
  a.push(root.val)
  postorder(root.left, a)
  postorder(root.right, a)

  a
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  inoder(root.left) == inoder_op(root.right)
end