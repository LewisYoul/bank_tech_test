require 'date'

class Transaction
  attr_accessor :balance, :credit, :debit, :date

  def initialize(balance, credit, debit, date = Date.today.to_s)
    @balance = balance
    @credit = credit
    @debit = debit
    @date = date
  end

end
