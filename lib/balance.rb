class Balance

  attr_reader :amount, :error

  INITIAL_AMOUNT = 0

  def initialize(error = Error.new)
    @error = error
    @amount = INITIAL_AMOUNT
  end

  def credit_balance(amount)
    @error.credit_checks(@amount, amount)
    @amount += amount
  end

  def debit_balance(amount)
    @error.debit_checks(@amount, amount)
    @amount -= amount
  end
end
