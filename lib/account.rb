class Account
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def add_funds(amount)
    @balance += amount
  end

  def remove_funds(amount)
    fail "You have insufficient funds" if (@balance - amount) < 0
    @balance -= amount
  end

end
