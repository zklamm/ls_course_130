# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.

# input: pos int
# output: ary of all divisors of input
# assume: output does not have to be ordered
# logic: from 1 up to the input, see if input / current is an integer

# def divisors(int)
#   half = int / 2
#   list = [1]
#   half.downto(2) do |i|
#     if int % i == 0
#       list << i
#       # list << (int / i) unless i == 1
#     end
#   end
#   list.sort
# end

def divisors(int)
  divs = [1, int]
  return divs.uniq if int == 1
  denom = 2
  until divs.include?(denom)
    inverse = int / denom
    if int % denom == 0
      divs.push(denom, inverse)
    end
    denom += 1
  end
  divs.uniq.sort
end

# Examples

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)

