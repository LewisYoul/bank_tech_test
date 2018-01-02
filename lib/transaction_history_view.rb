require_relative 'transaction_history'

class TransactionHistoryView

  attr_accessor :transaction_history_instance

  def initialize(transaction_history_instance = TransactionHistory.new)
    @transaction_history_instance = transaction_history_instance
  end

  def print_statement
    "date || credit || debit || balance"
  end

end
