class DebitTransaction

  attr_reader :debit

  def initialize(amount)
    @debit = amount
  end
end
