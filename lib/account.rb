require_relative './transaction_history_view'
require_relative './balance'
require_relative './error'

# Account is responsible for the account balance
class Account
  attr_accessor :balance, :transaction_history_view, :error

  MINIMUM = 0

  def initialize(
    transaction_history_view = TransactionHistoryView.new,
    balance = Balance.new,
    error = Error.new
  )
    @error = error
    @balance = balance
    @transaction_history_view = transaction_history_view
  end

  def print_statement
    @transaction_history_view.return_statement
  end

  def add_funds(amount)
    credit_checks(amount)
    @balance.credit_balance(amount)
    credit_account_and_create_transaction(amount)
  end

  def remove_funds(debit_amount)
    debit_checks(debit_amount)
    @balance.debit_balance(debit_amount)
    debit_account_and_create_transaction(debit_amount)
  end

  private

  def debit_checks(debit_amount)
    raise 'Please enter an Integer' unless debit_amount.is_a?(Integer)
    raise 'You have insufficient funds' if (@balance.amount - debit_amount) < MINIMUM
    raise "You can't withdraw a negative" if debit_amount < MINIMUM
  end

  def credit_checks(credit_amount)
    raise 'Please enter an Integer' unless credit_amount.is_a?(Integer)
    raise "You can't credit a negative value" if credit_amount <= MINIMUM
  end

  def credit_account_and_create_transaction(credit_amount)
    @transaction_history_view
      .transaction_history_instance
      .add_funds(credit_amount, @balance.amount)
  end

  def debit_account_and_create_transaction(debit_amount)
    @transaction_history_view
      .transaction_history_instance
      .remove_funds(debit_amount, @balance.amount)
  end
end
