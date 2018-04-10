#!/usr/bin/env ruby

# https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/769/
# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  9.times do |k|
    sub_sudoku_valid?(board, k, 0, 'vertical')
    sub_sudoku_valid?(board, 0, k, 'horizontal')

    start_x = (k % 3) * 3
    start_y = (k / 3).int * 3
    sub_sudoku_valid?(board, start_x, start_y, 'sub')
  end
end

def sub_sudoku_valid?(board, start_x, start_y, type)
  h = {}
  9.times do |k|
    h[k] = true
  end
  arr = []
  if type == 'vertical'
    9.times do |k|
      arr.push(board[start_x][k])
    end
  elsif type == 'horizontal'
    9.times do |k|
      arr.push(board[k][start_y])
    end
  else
    3.times do |x|
      3.times do |y|
        arr.push(board[start_x+x][start_y+y])
      end
    end
  end

  arr.each do |n|
    next if n == '.'
    return false if h.key?(n) == false || h[n] == false
    h[n] = false
  end

  true
end