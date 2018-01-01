require 'debit_transaction'

describe DebitTransaction do
  subject { DebitTransaction.new(500, "2018-01-01", 1000)}

  describe '#debit' do
    it 'should have a debit value of 500' do
      expect(subject.debit).to eq(500)
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
