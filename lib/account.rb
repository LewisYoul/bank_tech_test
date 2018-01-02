require_relative './transaction'

class Account
  attr_accessor :balance, :transaction_history_view

  def initialize(transaction_history_view = TransactionHistoryView, balance = 0)
    @balance = balance
    @transaction_history_view = transaction_history_view
  end

  def add_funds(credit_amount)
    fail "You can't credit a negative value" if credit_amount <= 0
    @balance += credit_amount
    # @transaction_history << @transaction_class.new(@balance, credit_amount, 0)
  end

  def remove_funds(debit_amount)
    fail "You have insufficient funds" if (@balance - debit_amount) < 0
    @balance -= debit_amount
    # @transaction_history << @transaction_class.new(@balance, 0, debit_amount)
  end

end
