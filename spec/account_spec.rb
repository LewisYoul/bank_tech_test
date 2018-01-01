require 'account'

describe Account do
  let(:debit_transaction_double) { double(:debit_transaction) }
  let(:credit_transaction_double) { double(:credit_transaction) }
  subject { Account.new(debit_transaction_double, credit_transaction_double) }

  describe '#balance' do
    it 'returns an initial balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#debit_transaction' do
    it 'should return the DebitTransaction class' do
      expect(subject.debit_transaction).to eq(debit_transaction_double)
    end
  end

  describe '#credit_transaction' do
    it 'should return the CreditTransaction class' do
      expect(subject.credit_transaction).to eq(credit_transaction_double)
    end
  end

  describe '#add_funds' do
    it 'adds 500 to the account balance' do
      subject.add_funds(500)
      expect(subject.balance).to eq(500)
    end
  end

  describe '#remove_funds' do
    it 'removes 500 from the account balance' do
      subject.add_funds(500)
      subject.remove_funds(500)
      expect(subject.balance).to eq(0)
    end
    it 'should throw an error if there are insufficient funds' do
      subject.add_funds(500)
      expect { subject.remove_funds(700) }.to raise_error("You have insufficient funds")
    end
  end
end
