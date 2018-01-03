require_relative './transaction.rb'

class TransactionHistory

  attr_accessor :all_transactions, :transaction_class

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @all_transactions = []
  end

  def add_funds(credit_amount, balance)
    @all_transactions << @transaction_class.new(balance, credit_amount, 0)
  end

  def remove_funds(debit_amount, balance)
    @all_transactions << @transaction_class.new(balance, 0, debit_amount)
  end

end
