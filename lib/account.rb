require_relative './transaction_history_view'

class Account
  attr_accessor :balance, :transaction_history_view

  def initialize(transaction_history_view = TransactionHistoryView.new, balance = 0)
    @balance = balance
    @transaction_history_view = transaction_history_view
  end

  def print_statement
    @transaction_history_view.return_statement
  end

  def add_funds(credit_amount)
    fail "You can't credit a negative value" if credit_amount <= 0
    @balance += credit_amount
    credit_account_and_create_transaction(credit_amount)
  end

  def remove_funds(debit_amount)
    fail "You have insufficient funds" if (@balance - debit_amount) < 0
    fail "You can't withdraw a negative" if debit_amount < 0
    @balance -= debit_amount
    debit_account_and_create_transaction(debit_amount)
  end

  private

  def credit_account_and_create_transaction(credit_amount)
    @transaction_history_view.transaction_history_instance.add_funds(credit_amount, @balance)
  end

  def debit_account_and_create_transaction(debit_amount)
    @transaction_history_view.transaction_history_instance.remove_funds(debit_amount, @balance)
  end
end
