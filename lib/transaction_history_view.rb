require_relative 'transaction_history'

class TransactionHistoryView

  attr_accessor :transaction_history_instance

  def initialize(transaction_history_instance = TransactionHistory.new)
    @transaction_history_instance = transaction_history_instance
  end

  def return_statement
    print "date || credit || debit || balance\n" + create_statements
  end

  private

  def create_statements
    print_array = @transaction_history_instance.all_transactions.reverse.map do |transaction|
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
    print_array.join("\n")
  end
end
