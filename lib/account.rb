class Account
  attr_accessor :balance, :debit_transaction, :credit_transaction, :transaction_history

  def initialize(debit_class = DebitTransaction, credit_class = CreditTransaction, balance = 0)
    @balance = balance
    @transaction_history = []
    @debit_transaction = debit_class
    @credit_transaction = credit_class
  end

  def add_funds(amount)
    @balance += amount
    @transaction_history << @credit_transaction.new(amount)
  end

  def remove_funds(amount)
    fail "You have insufficient funds" if (@balance - amount) < 0
    @balance -= amount
    @transaction_history << @debit_transaction.new(amount)
  end

end
