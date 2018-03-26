require 'minitest/autorun'

# Write a minitest assertion that will fail if value is not nil

class Testing < MiniTest::Test
  def test_nil
    assert_nil(nil)
  end
end
