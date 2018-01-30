class Error

  def debit_checks(balance_amount, amount)
    raise 'Please enter an Integer' unless amount.is_a?(Integer)
    raise 'You have insufficient funds' if (balance_amount - amount) < 0
    raise "You can't withdraw a negative" if amount < 0
  end

  def credit_checks(balance_amount, amount)
    raise 'Please enter an Integer' unless amount.is_a?(Integer)
  end
end
