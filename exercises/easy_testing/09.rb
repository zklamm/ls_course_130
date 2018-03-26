# Write a unit test that will fail if list and the return value of list.process
# are different objects.

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_lists
    assert_same(list, list.process)
  end
end
