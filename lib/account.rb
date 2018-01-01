class Account
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def add_funds(amount)
    @balance += amount
  end

end
