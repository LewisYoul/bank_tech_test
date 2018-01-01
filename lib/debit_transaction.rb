require 'date'

class DebitTransaction

  attr_reader :debit, :date

  def initialize(amount, date = Date.today.to_s)
    @debit = amount
    @date = date
  end
end
