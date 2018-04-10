#!/usr/bin/ruby

def random_int(min, max)
  rand(max - min) + min
end

def generate(count = 5, n_min = 1, n_max = 300)
  arr = Array.new
  i = 0
  loop do
    arr.push random_int(n_min, n_max)
    i += 1
    if i == count
      break
    end
  end
  arr
end

# check execution time
def execution_time(arr)
  start = Time.now
  solve(arr)
  finish = Time.now
  finish - start
end


# compare the results of "working solution" with "optimized solution"
def compare_solutions(count = 5, n_min = 1, n_max = 300)
  arr = generate(count, n_min, n_max)
  if solve(arr) != solve_opt(arr)
    puts "\nFAILED"
    puts 'data: ' + arr.to_s
    puts 'solution: ' + solve(arr).to_s
    puts 'optimized solution: ' +  solve_opt(arr).to_s
  end
end

def run_compare_solutions(count = 5, n_min = 1, n_max = 300, times = 100)
  i = 0
  loop do
    compare_solutions(count, n_min, n_max)
    i += 1
    if i == times
      break
    end
  end
end


# solve the solution
def solve (arr)
  max1 = 0
  max2 = 0
  arr.each do |i|
    i = i.to_i
    if i > max1
      max2 = max1
      max1 = i
    elsif i > max2
      max2 =i
    end
  end

  max1 * max2
end

def solve_opt (arr)
  max1 = 0
  max2 = 0
  arr.each do |i|
    i = i.to_i
    if i > max1
      max2 = max1
      max1 = i
    elsif i > max2
      max2 =i
    end
  end

  max1 * max2
end


puts run_compare_solutions
#
# puts execution_time(generate(10))
# puts execution_time(generate(100))
# puts execution_time(generate(1000))
# puts execution_time(generate(10000, 1, 10000000))
# puts execution_time(generate(100000, 1, 10000000))
# puts execution_time(generate(100000000, 1, 100000000))

