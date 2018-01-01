require 'credit_transaction'

describe CreditTransaction do
  subject { CreditTransaction.new(500, "2018-01-01")}

  describe '#credit' do
    it 'should have a credit value of 500' do
      five_hundred = CreditTransaction.new(500)
      expect(five_hundred.credit).to eq(500)
    end
  end

  describe '#date' do
    it 'should return the given date' do
      expect(subject.date).to eq("2018-01-01")
    end
  end
end
