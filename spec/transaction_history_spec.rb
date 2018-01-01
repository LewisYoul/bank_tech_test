require 'transaction_history'

describe TransactionHistory do
  subject { TransactionHistory.new }
  describe '#all_transactions' do
    it 'should be an instance of Array' do
      expect(subject.all_transactions).to be_an_instance_of(Array)
    end
  end
end
