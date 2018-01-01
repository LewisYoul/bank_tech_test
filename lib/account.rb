class Account
  attr_accessor :balance, :debit_transaction, :credit_transaction

  def initialize(debit_class, credit_class, balance = 0)
    @balance = balance
    @debit_transaction = debit_class
    @credit_transaction = credit_class
  end

  def add_funds(amount)
    @balance += amount
  end

  def remove_funds(amount)
    fail "You have insufficient funds" if (@balance - amount) < 0
    @balance -= amount
  end

end
