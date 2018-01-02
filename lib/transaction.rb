require 'date'

class Transaction
  attr_accessor :balance, :credit, :debit, :date

  def initialize(balance, credit, debit, date = Date.today.to_s)
    @balance = balance
    @credit = credit
    @debit = debit
    @date = format_date(date)
  end

  private

  def format_date(date)
    arr = date.split("-")
    (arr[0], arr[1], arr[2] = arr[2], arr[1], arr[0]).join("/")
  end

end
