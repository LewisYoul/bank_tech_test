require 'debit_transaction'

describe DebitTransaction do
  describe '#debit' do
    it 'should have a debit value of 500' do
      five_hundred = DebitTransaction.new(500)
      expect(five_hundred.debit).to eq(500)
    end
  end
end
