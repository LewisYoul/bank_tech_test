require 'transaction'

describe Transaction do
  describe '#balance' do
    it 'should return the account balance when the transaction was made' do
      acc_debit = Transaction.new(1000, 0, 500, '2019-02-03')
      expect(acc_debit.balance).to eq(1000)
    end
  end
  describe '#debit' do
    it 'should have a debit value of 500' do
      acc_debit = Transaction.new(1000, 0, 500, '2018-01-02')
      expect(acc_debit.debit).to eq(500)
    end
  end
  describe '#credit' do
    it 'should have a credit value of 500' do
      acc_credit = Transaction.new(1000, 500, 0, '2018-01-02')
      expect(acc_credit.credit).to eq(500)
    end
  end
  describe '#date' do
    it 'should return the date in the expected format' do
      acc_credit = Transaction.new(1000, 500, 0, '2018-01-02')
      expect(acc_credit.date).to eq('02/01/2018')
    end
  end
end
