#!/usr/bin/env ruby

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def sum_numbers(root)
  sum(root, 0)
end

def sum(root, sum)
  return 0 if root.nil?
  sum = sum * 10 + root.val
  return sum if root.left.nil? && root.right.nil?

  sum(root.left, sum) + sum(root.right, sum)
end