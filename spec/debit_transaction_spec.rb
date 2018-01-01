require 'debit_transaction'

describe DebitTransaction do
  subject { DebitTransaction.new(500, "2018-01-01")}

  describe '#debit' do
    it 'should have a debit value of 500' do
      five_hundred = DebitTransaction.new(500)
      expect(five_hundred.debit).to eq(500)
    end
  end
  describe '#date' do
    it 'should return the given date' do
      expect(subject.date).to eq("2018-01-01")
    end
  end
end
