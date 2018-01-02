class Account
  attr_accessor :balance, :transaction_class, :transaction_history

  def initialize(transaction_class = Transaction, balance = 0)
    @balance = balance
    @transaction_history = []
    @transaction_class = transaction_class
  end

  def add_funds(credit_amount)
    @balance += credit_amount
    @transaction_history << @transaction_class.new(@balance, credit_amount, 0)
  end

  def remove_funds(debit_amount)
    fail "You have insufficient funds" if (@balance - debit_amount) < 0
    @balance -= debit_amount
    @transaction_history << @transaction_class.new(@balance, 0, debit_amount)
  end

end
