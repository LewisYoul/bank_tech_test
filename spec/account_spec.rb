require 'account'

describe Account do
  let(:transaction) { double(:transaction) }
  let(:transaction_history_instance) { double(:transaction_history_instance) }
  let(:transaction_view_instance) { double(:transaction_view_instance, transaction_history_instance: transaction_history_instance) }
  subject { Account.new(transaction_view_instance) }

  describe '#balance' do
    it 'returns an initial balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#transaction_history_view' do
    it 'returns an instance of TransactionHistoryView' do
      expect(subject.transaction_history_view).to eq(transaction_view_instance)
    end
  end

  describe '#add_funds' do
    it 'adds 500 to the account balance' do
      allow(transaction_history_instance).to receive(:add_funds).with(500, 500)
      subject.add_funds(500)
      expect(subject.balance).to eq(500)
    end
    it 'throws an error if a negative credit value is given' do
      expect { subject.add_funds(-300) }.to raise_error("You can't credit a negative value")
    end
  end

  describe '#remove_funds' do
    it 'removes 500 from the account balance' do
      allow(transaction_history_instance).to receive(:add_funds).with(500, 500)
      allow(transaction_history_instance).to receive(:remove_funds).with(500, 0)
      subject.add_funds(500)
      subject.remove_funds(500)
      expect(subject.balance).to eq(0)
    end
    it 'should throw an error if there are insufficient funds' do
      expect { subject.remove_funds(700) }.to raise_error("You have insufficient funds")
    end
  end

  # describe '#transaction_history' do
  #   it 'should be an instance of Array' do
  #     expect(subject.transaction_history).to be_an_instance_of(Array)
  #   end
  #   it 'should contain a Transaction object after adding funds' do
  #     allow(transaction).to receive(:new).with(500, 500, 0).and_return(transaction_instance)
  #     subject.add_funds(500)
  #     expect(subject.transaction_history[0]).to eq(transaction_instance)
  #   end
  #   it 'should contain a Transaction object after removing funds' do
  #     allow(transaction).to receive(:new).with(500, 500, 0).and_return(transaction_instance)
  #     subject.add_funds(500)
  #     allow(transaction).to receive(:new).with(0, 0, 500).and_return(transaction_instance)
  #     subject.remove_funds(500)
  #     expect(subject.transaction_history[1]).to eq(transaction_instance)
  #   end
  # end
end
