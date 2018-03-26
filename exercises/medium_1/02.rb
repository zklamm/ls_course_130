# Fill out the rest of the Ruby code below so that print output like that shown
# in "Sample Output." You should read the text from a simple text file that you
# provide. (We also supply some example text below, but try the program with
# your text as well.)

# Read the text file in the #process method and pass the text to the block
# provided in each call. Everything you need to work on is either part of the
# #process method or part of the blocks. You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample
# output but should have the indicated format.

# Sample Text File:

# Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
# enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
# aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa
# laborum nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur
# tempor ea sit consequat cupidatat.

# Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur
# quis aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint
# ipsum pariatur nisi adipisicing exercitation id adipisicing qui. Nulla
# proident ad elit dolore exercitation cupidatat mollit consequat enim
# cupidatat tempor aliqua ea sunt ex nisi non.

# Officia dolore labore non labore irure nisi ad minim consectetur non irure
# veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco
# veniam commodo.


class TextAnalyzer
  def process
    file = File.open('02.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

# Sample Output:

# 3 paragraphs
# 15 lines
# 126 words
