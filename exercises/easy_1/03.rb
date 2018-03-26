# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

# input: sorted ary of ints
# output: ary that has all missing ints between min and max

def missing(ary)
  missing = []
  ary.first.upto(ary.last) do |int|
    missing << int unless ary.include?(int)
  end
  missing
end

# Examples:

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
