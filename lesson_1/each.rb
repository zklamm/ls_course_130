def each(ary)
  counter = 0

  until counter == ary.size
    yield(ary[counter])
    counter += 1
  end

  ary
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end
