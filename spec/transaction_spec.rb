require 'transaction'

describe Transaction do

  describe '#debit' do
    it 'should have a debit value of 500' do
      acc_debit = Transaction.new(1000, 0, 500, "2018-01-02")
      expect(acc_debit.debit).to eq(500)
    end
  end
  describe '#credit' do
    it 'should have a credit value of 500' do
      acc_credit = Transaction.new(1000, 500, 0, "2018-01-02")
      expect(acc_credit.credit).to eq(500)
    end
  end
end
