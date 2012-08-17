# You are given two vectors v1=(x_1,x_2,...,x_n) and v2=(y_1,y_2,...,y_n). The 
# scalar product of these vectors is a single number, calculated as 
# x_1*y_1 + x_2*y_2 + ... + x_n*y_n.
#
# Suppose you are allowed to permute the coordinates of each vector as you wish.
# Choose two permutations such that the scalar product of your two new vectors 
# is the smallest possible, and output that minimum scalar product.
# 
# http://code.google.com/codejam/contest/32016/dashboard#s=p0
# Sort each vector. Pair up largest positive number of one set with largest 
# negative number of other set.

def min_scalar_product(vector1, vector2)
  return vector1.sort.zip(vector2.sort { |a,b| b <=> a }).map { |x| x.reduce(:*) }.reduce(:+)
end

p min_scalar_product([1, 3, -5], [-2, 4, 1])
p min_scalar_product([1, 2, 3, 4, 5], [1, 0, 1, 0, 1])