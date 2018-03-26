def select(ary)
  selected = []
  ary.each do |elem|
    selected << elem if yield(elem)
  end
  selected
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num"
# returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5],
# because "num + 1" evaluates to true
