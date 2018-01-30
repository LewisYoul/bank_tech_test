class Balance

  attr_accessor :amount

  INITIAL_AMOUNT = 0

  def initialize
    @amount = INITIAL_AMOUNT
  end

  def credit_balance(amount)
    @amount += amount
  end

  def debit_balance(amount)
    @amount -= amount
  end
end
