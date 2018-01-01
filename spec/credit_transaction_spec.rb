require 'credit_transaction'

describe CreditTransaction do
  subject { CreditTransaction.new(500, "2018-01-01", 1000)}

  describe '#credit' do
    it 'should have a credit value of 500' do
      expect(subject.credit).to eq(500)
    end
  end

  describe '#date' do
    it 'should return the given date' do
      expect(subject.date).to eq("2018-01-01")
    end
  end

  describe '#balance' do
    it 'returns the balance at the point when the transaction was made' do
      expect(subject.balance).to eq(1000)
    end
  end
end
