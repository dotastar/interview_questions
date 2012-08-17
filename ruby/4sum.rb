#!/usr/bin/env ruby

# Given an array of integers, output a list of four integers that sum to zero 
# (the same input integer can be used multiple times), or indicate that no such 
# set of four integers exists. For example, given the array (2 3 1 0 -4 -1), the
# set of four integers (3 1 0 -4) sums to zero, as does the set (0 0 0 0).
#
# http://programmingpraxis.com/2012/08/14/4sum/
# basically same thing as 3SUM, which can be solved in O(n^2) time

def four_sum(input_set, num)
  input_set.sort!
  for i in 0.upto(input_set.length - 4)
    first = input_set[i]
    for j in (i+1).upto(input_set.length - 3) 
      second = input_set[j]
      k = j + 1
      l = input_set.length - 1
      while k < l
        third = input_set[k]
        fourth = input_set[l]

        total = first + second + third + fourth
        if total == num
          return [first, second, third, fourth]
        elsif total > num
          l = l - 1
        elsif total < num
          k = k + 1
        end
      end
    end
  end

  return []
end

p four_sum([2, 3, 1, 0, -4, 1], 0)
p four_sum([-25, -10, -7, -3, 2, 4, 8, 10], 0)