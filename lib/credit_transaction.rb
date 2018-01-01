require 'date'

class CreditTransaction

  attr_reader :credit, :date, :balance

  def initialize(amount, date = Date.today.to_s, balance)
    @credit = amount
    @date = date
    @balance = balance
  end
end
