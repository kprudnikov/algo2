#!/usr/bin/env ruby
# avito zmeika from matrix

def path(k)
  x = k
  y = 1 - k
  path = []
  direction = 1
  (k*8).times do |i|
    path.push(x.to_s + ';' + y.to_s)
    if direction == 1
      y += 1
      direction = 2 if y == k
    elsif direction == 2
      x -= 1
      direction = 3 if x * (-1) == k
    elsif direction == 3
      y -= 1
      direction = 4 if y * (-1) == k
    elsif direction == 4
      x += 1
    end
  end
  path
end

def zmeika(k)
  a = ['0;0']
  k.times do |i|
    a += path(i+1)
  end
  a
end
puts zmeika(4)