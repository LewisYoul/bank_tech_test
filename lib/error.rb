class Error
  MINIMUM_BALANCE = 0

  def debit_checks(balance_amount, amount)
    raise 'Please enter an Integer' unless amount.is_a?(Integer)
    raise 'You have insufficient funds' if (balance_amount - amount) < MINIMUM_BALANCE
    raise "You can't withdraw a negative" if amount < MINIMUM_BALANCE
  end

  def credit_checks(balance_amount, amount)
    raise 'Please enter an Integer' unless amount.is_a?(Integer)
    raise "You can't credit a negative value" if amount <= MINIMUM_BALANCE
  end
end
