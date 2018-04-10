#!/usr/bin/env ruby

def calc(n = 10)
  s = {}
  # sn = []
  n.times do |a|
    n.times do |b|
      p = a ** 3 + b ** 3
      aa = { :p => p, :a => a, :b => b}
      puts aa
      # s.push(p)
      # sn.push([a, b])
    end
  end

  # n.times do |a|
  #   n.times do |b|
  #     p = a ** 3 + b ** 3
  #
  #     if
  #     s.push(p)
  #     sn.push([a, b])
  #   end
  # end

end


puts calc