#!/usr/bin/ruby

numbers = $stdin.read.split
a = numbers[0].to_i
b = numbers[1].to_i

def gcd(a, b)
  if b > a
    c = b
    b = a
    a = c
  end

  if a == 0 || b == 0
    return 0
  end

  if (a-b) < b
    return 1
  end

  loop do
    d = (a/b).to_i
    r = a - (b*d)

    if r == 0
      return b
    end

    a = b
    b = r
  end
end

puts gcd(a, b)