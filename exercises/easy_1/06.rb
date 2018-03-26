# A great way to learn about blocks is to implement some of the core ruby
# methods that use blocks using your own code. Over this exercise and the next
# several exercises, we will do this for a variety of different standard
# methods.

# The Enumerable#any? method processes elements in a collection by passing each
# element value to a block that is provided in the method call. If the block
# returns a value of true for any element, then #any? returns true. Otherwise,
# any? returns false. Note in particular that #any? will stop searching the
# collection the first time the block returns true.

# Write a method called any? that behaves similarly for Arrays. It should take
# an Array as an argument, and a block. It should return true if the block
# returns true for any of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block
# returns true.

# If the Array is empty, any? should return false, regardless of how the block
# is defined.

# Your method may not use any standard ruby method that is named all?, any?,
# none?, or one?.

def any?(ary)
  ary.each { |elem| return true if yield(elem) }
  false
end

# Examples:

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
