require 'minitest/autorun'

# Write a minitest assertion that will fail if the 'xyz' is not in the Array
# list.

class Testing < MiniTest::Test
  def test_array
    list = ['xyz']
    assert_includes(list, 'xyz')
  end
end
