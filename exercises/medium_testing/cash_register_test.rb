require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  attr_reader :register, :transaction

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(35)
  end

  def test_accept_money
    transaction.amount_paid = 15
    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    assert_equal(previous_amount + 15, current_amount)
  end

  def test_change
    transaction.amount_paid = 40
    assert_equal(5, register.change(transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{transaction.item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end
