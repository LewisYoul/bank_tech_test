require_relative './transaction.rb'

class TransactionHistory
  attr_accessor :all_transactions, :transaction_class

  UNUSED_TRANSACTION = 0

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @all_transactions = []
  end

  def add_funds(credit_amount, balance)
    @all_transactions << @transaction_class.new(balance, credit_amount, UNUSED_TRANSACTION)
  end

  def remove_funds(debit_amount, balance)
    @all_transactions << @transaction_class.new(balance, UNUSED_TRANSACTION, debit_amount)
  end

end
