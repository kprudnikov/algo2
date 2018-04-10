#!/usr/bin/env ruby

# https://leetcode.com/problems/merge-two-sorted-lists/description/

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  # @param [int] val
  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  # @param [int] val
  def initialize(val)
    @head = ListNode.new(val)
  end

  def head
    @head
  end

  def add(val)
    current = @head
    until current.next == nil
      current = current.next
    end

    n = ListNode.new(val)
    current.next = n
  end

  def delete(val)
    current = @head
    if current.val == val
      @head = current.next
      return
    end

    while current.next != nil
      if current.next.val == val
        current.next = current.next.next
        break
      end
      current = current.next
    end
  end

  def out_arr
    out = []
    current = @head
    until current.next.nil?
      out.push(current.val)
      current = current.next
    end
    out.push(current.val)
  end

  def revert_list
    current = @head
    prev = nil
    until current.nil?
      tmp = current.next
      current.next = prev
      prev = current
      current = tmp
    end
    @head = prev
  end
end

l1 = LinkedList.new(1)
l1.add(2)
l1.add(3)
l1.add(4)
l1.add(5)
l2 = LinkedList.new(1)
l2.add(2)
l2.add(3)

puts l1.out_arr.to_s
# puts l2.out_arr.to_s

def out(head)
  a = []
  current = head
  until current.nil?
    a.push(current.val)
    current = current.next
  end

  a.to_s
end

# https://leetcode.com/problems/merge-two-sorted-lists/description/
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  n = nil
  l = nil
  root = nil
  until l1.nil? || l2.nil?
    l = n unless n.nil?
    if l1.val <= l2.val
      n = ListNode.new(l1.val)
      l1 = l1.next
    else
      n = ListNode.new(l2.val)
      l2 = l2.next
    end

    if l.nil?
      root = n
    else
      l.next = n
    end
  end
  if l.nil?
    l = n
  else
    l = l.next
  end
  l.next = l1 unless l1.nil?
  l.next = l2 unless l2.nil?

  root
end

# puts merge_two_lists(l1.head, l2.head)

# https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  all = 0
  current = head
  until current.nil?
    all += 1
    current = current.next
  end

  index = all - n

  return head if index < 0

  if index == 0
    return head.next
  end

  i = 0
  current = head
  until current.nil?
    if i == index - 1
      current.next = current.next.next
    end
    current = current.next
    i += 1
  end

  head
end

puts out(remove_nth_from_end(l1.head, 6))
