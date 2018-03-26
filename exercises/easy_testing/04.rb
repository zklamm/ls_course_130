require 'minitest/autorun'

# Write a minitest assertion that will fail if the Array list is not empty.

class Testing < MiniTest::Test
  def test_array
    list = []
    assert_empty(list)
  end
end
