require 'transaction_history'

describe TransactionHistory do
  let(:transaction_class) { double(:transaction_class) }
  let(:credit_transaction_instance) { double(:credit_transaction_instance) }
  let(:debit_transaction_instance) { double(:debit_transaction_instance) }
  subject { TransactionHistory.new(transaction_class) }

  describe '#transaction_class' do
    it 'should return the Transaction class' do
      expect(subject.transaction_class).to eq(transaction_class)
    end
  end

  describe '#all_transactions' do
    it 'should be an instance of Array' do
      expect(subject.all_transactions).to be_an_instance_of(Array)
    end
  end

  describe '#add_funds' do
    it 'adds the transaction to the transaction history' do
      allow(transaction_class).to receive(:new)
        .with(500, 500, 0)
        .and_return(credit_transaction_instance)
      subject.add_funds(500, 500)
      expect(subject.all_transactions[0]).to eq(credit_transaction_instance)
    end
  end

  describe '#remove_funds' do
    it 'adds the transaction to the transaction history' do
      allow(transaction_class).to receive(:new)
        .with(0, 0, 500)
        .and_return(debit_transaction_instance)
      subject.remove_funds(500, 0)
      expect(subject.all_transactions[0]).to eq(debit_transaction_instance)
    end
  end
end
