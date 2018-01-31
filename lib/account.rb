require_relative './balance'
require_relative './transaction_history_view'

class Account
  attr_accessor :balance, :transaction_history_view

  def initialize(transaction_history_view = TransactionHistoryView.new,
                                  balance = Balance.new)
    @balance = balance
    @transaction_history_view = transaction_history_view
  end

  def print_statement
    @transaction_history_view.return_statement
  end

  def add_funds(amount)
    @balance.credit_balance(amount)
    credit_account_and_create_transaction(amount)
  end

  def remove_funds(debit_amount)
    @balance.debit_balance(debit_amount)
    debit_account_and_create_transaction(debit_amount)
  end

  private

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
