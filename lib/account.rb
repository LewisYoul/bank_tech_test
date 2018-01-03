require_relative './transaction_history_view'

class Account
  attr_accessor :balance, :transaction_history_view

  MINIMUM = 0

  def initialize(transaction_history_view = TransactionHistoryView.new, balance = 0)
    @balance = balance
    @transaction_history_view = transaction_history_view
  end

  def print_statement
    @transaction_history_view.return_statement
  end

  def add_funds(credit_amount)
    credit_checks(credit_amount)
    @balance += credit_amount
    credit_account_and_create_transaction(credit_amount)
  end

  def remove_funds(debit_amount)
    debit_checks(debit_amount)
    @balance -= debit_amount
    debit_account_and_create_transaction(debit_amount)
  end

  private

  def debit_checks(debit_amount)
    fail "Please enter an Integer" if !debit_amount.is_a?(Integer)
    fail "You have insufficient funds" if (@balance - debit_amount) < MINIMUM
    fail "You can't withdraw a negative" if debit_amount < MINIMUM
  end

  def credit_checks(credit_amount)
    fail "Please enter an Integer" if !credit_amount.is_a?(Integer)
    fail "You can't credit a negative value" if credit_amount <= MINIMUM
  end

  def credit_account_and_create_transaction(credit_amount)
    @transaction_history_view.transaction_history_instance.add_funds(credit_amount, @balance)
  end

  def debit_account_and_create_transaction(debit_amount)
    @transaction_history_view.transaction_history_instance.remove_funds(debit_amount, @balance)
  end

end
