require 'minitest/autorun'

# Write a minitest assertion that will fail if value.downcase does not return
# 'xyz'.

class Testing < MiniTest::Test
  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
