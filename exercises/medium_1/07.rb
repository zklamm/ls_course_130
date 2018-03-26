# For this exercise, we'll be learning and practicing our knowledge of
# returning from lambdas, procs, and implicit blocks. Run each group of code
# below: For your answer to this exercise, write down your observations for
# each group of code. After writing out those observations, write one final
# analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# check_return_with_proc

# My observations:
=begin
Nothing is printed to the screen. It seems the return on line 9 is executed
even before being called.
=end

# Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# My observations:
=begin
Again, it seems the return, which is inside a block, is executed before being
called.
=end

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# My observations:
=begin
The lambda seems to let execution pass over the return inside the block until
it is explicitly called.
=end

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# My observations:
=begin
Same observation as Group 3.
=end

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# My observations:
=begin
Not even sure what's going on here.
=end

# Final analysis:
=begin
It seems lambdas let execution passover their blocks until called, Procs and
# implicit blocks do not.
=end
