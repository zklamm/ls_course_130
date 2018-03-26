require 'minitest/autorun'

# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.

class NoExperienceError < StandardError; end

class Testing < MiniTest::Test
  def test_error
    employee = 'bob'
    assert_raises(NoExperienceError) { employee.hire }
  end
end
