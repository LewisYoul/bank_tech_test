require 'date'

class DebitTransaction

  attr_reader :debit, :date, :balance

  def initialize(amount = 0, date = Date.today.to_s, balance = 0)
    @debit = amount
    @date = date
    @balance = balance
  end
end
