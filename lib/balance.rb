class Balance
  attr_reader :amount, :error

  INITIAL_AMOUNT = 0

  def initialize(error = Error.new)
    @error = error
    @amount = INITIAL_AMOUNT
  end

  def credit_balance(credit_amount)
    @error.credit_checks(@amount, credit_amount)
    @amount += credit_amount
  end

  def debit_balance(debit_amount)
    @error.debit_checks(@amount, debit_amount)
    @amount -= debit_amount
  end
end
