# Write a unit test that will fail if 'xyz' is one of the elements in the Array
# list:

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_list
    list = ['abc', 'def']
    refute_includes(list, 'xyz')
  end
end
