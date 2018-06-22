require 'minitest/autorun'

# Write a minitest assertion that will fail if the value.odd? is not true.

class Testing < MiniTest::Test
  def test_odd
    assert_equal(true, 5.odd?)
    assert_equal(false, 4.odd?)
  end
end
