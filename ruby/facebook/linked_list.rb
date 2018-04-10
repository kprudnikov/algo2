#!/usr/bin/env ruby

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  current = head
  prev = nil
  until current.nil?
    tmp = current.next
    current.next = prev
    prev = current
    current = tmp
  end

  prev
end

def list_arr(head)
  arr = []
  current = head
  until current.nil?
    arr.push(current.val)
    current = current.next
  end

  arr
end

# # l = ListNode.new(1)
# # l.next = ListNode.new(2)
# # l.next.next = ListNode.new(3)
# # l.next.next.next = ListNode.new(4)
# # l.next.next.next.next = ListNode.new(5)
#
# puts list_arr(l).to_s
# puts list_arr(reverse_list(l)).to_s

# https://leetcode.com/problems/remove-linked-list-elements/description/
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  return head if head.nil?
  while head.val == val
    head = head.next
    return head if head.nil?
  end
  current = head
  until current.next.nil?
    while current.next.val == val
      current.next = current.next.next
      break if current.next.nil?
    end
    break if current.next.nil?
    current = current.next
  end

  head
end

l = ListNode.new(6)
l.next = ListNode.new(6)
l.next.next = ListNode.new(3)
l.next.next.next = ListNode.new(4)
l.next.next.next.next = ListNode.new(5)
l.next.next.next.next.next = ListNode.new(6)
l.next.next.next.next.next.next = ListNode.new(7)
l.next.next.next.next.next.next.next = ListNode.new(6)
l.next.next.next.next.next.next.next.next = ListNode.new(6)

puts list_arr(l).to_s
puts list_arr(remove_elements(l, 6)).to_s


# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)

end