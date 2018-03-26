# Write a minitest assertion that will fail if the class of value is not
# Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

require 'minitest/autorun'

class Testing < MiniTest::Test
  def test_numeric
    num1 = Numeric.new
    assert_kind_of(Numeric, num1)
    assert_kind_of(Numeric, 5)
    assert_kind_of(Numeric, 5.0)
  end
end
