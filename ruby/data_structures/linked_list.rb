#!/usr/bin/env ruby

class ListNode
  attr_accessor :val, :next

  # @param [int] val
  # @param [ListNode] next_node
  def initialize(val, next_node)
    @val = val
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  # @param [int] val
  def initialize(val)
    @head = ListNode.new(val, nil)
  end

  def head
    @head
  end

  def add(val)
    current = @head
    until current.next == nil
      current = current.next
    end

    n = ListNode.new(val, nil)
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
l1.add(4)
l2 = LinkedList.new(1)
l2.add(2)
l2.add(3)







def add_two_numbers(l1, l2)
  l1 = revert_linked_list(l1)
  l2 = revert_linked_list(l2)
  number = number_from_list(l1) + number_from_list(l2)
  arr = []
  number.to_s.each_char do |n|
    arr.unshift n.to_i
  end
  arr
end

def revert_linked_list(l)
  current = l
  prev = nil
  until current.nil?
    tmp = current.next
    current.next = prev
    prev = current
    current = tmp
  end

  prev
end

def number_from_list(l)
  current = l
  string = ''
  until current.next.nil?
    string += current.val.to_s
    current = current.next
  end
  string += current.val.to_s
  string.to_i
end

print add_two_numbers(l1.head, l2.head)