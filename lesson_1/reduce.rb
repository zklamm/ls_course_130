# Try to write a reduce method on your own that exhibits this behavior.
# Your reduce should take at least 1 argument that represents the array we'll
# operate on. It should also take an optional second argument that represents
# the default value for the accumulator.

def reduce(ary, init=0)
  ary.each { |n| init = yield(init, n) }
  init
end

# Here's a few examples that we should be able to call on your method.

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError:
# undefined method `+' for nil:NilClass
