require 'date'

class CreditTransaction

  attr_reader :credit, :date

  def initialize(amount, date = Date.today.to_s)
    @credit = amount
    @date = date
  end
end
