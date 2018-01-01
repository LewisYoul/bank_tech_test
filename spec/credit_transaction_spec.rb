require 'credit_transaction'

describe CreditTransaction do
  describe '#add_credit' do
    it 'should have a credit value of 500' do
      five_hundred = CreditTransaction.new(500)
      expect(five_hundred.credit).to eq(500)
    end
  end
end
