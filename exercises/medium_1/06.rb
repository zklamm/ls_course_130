# For this exercise, we'll be learning and practicing our knowledge of the
# arity of lambdas, procs, and implicit blocks. Two groups of code also deal
# with the definition of a Proc and a Lambda, and the differences between the
# two. Run each group of code below: For your answer to this exercise, write
# down your observations for each group of code. After writing out those
# observations, write one final analysis that explains the differences between
# procs, blocks, and lambdas.

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# My observations:
=begin
It seems you can instantiate a new Proc object with the 'proc' syntax and
passing it a block.
When you call the Proc object, my_proc, the argument that is passed in is then
referenced by the block parameter that was defined upon instantiation. If no
argument is given, the block parameter represents nil and does not raise an
exception.
=end

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# My observations:
=begin
It seems lambdas are also Proc objects, and you can instantiate them similar to
the 'proc' syntax, but you use 'lambda' and still pass in a block. It appears
you can also use the syntax of -> (thing) with a block to instantiate a lambda
and define the block parameter. When the lambda is called (using the #call
method) without an argument, Ruby raises an exception and does not represent
the block parameter as 'nil' as the proc did. It also appears there is no such
thing as a Lambda class.
=end

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# My observations:
=begin
It appears if you are yielding to a block, and that block takes a parameter,
you explicitly have to pass it an argument, otherwise the parameter will
represent 'nil' (and not raise an exception)
Also, if you specify a yield in the code without possibly bypassing it with
a conditional (i.e., #block_given?), an exception will be raised.
=end

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# My observations:
=begin
It appears if you pass a block only one parameter when it is expecting two,
it will still run with no exceptions and simply representing the extra
parameters as 'nil'.
Also, blocks create their own scope. This is why 'animal' is not available
inside the block on line 73.
=end

# Final analysis
=begin
It seems the main difference between the three closure types in Ruby is that
there are differences in arity rules. 
=end
