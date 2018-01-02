require 'transaction_history_view'

describe TransactionHistoryView do
  let(:transaction_history_instance) { double(:transaction_history_instance) }
  subject { TransactionHistoryView.new(transaction_history_instance) }

  describe '#transaction_history' do
    it 'returns an instance of TransactionHistory' do
      expect(subject.transaction_history_instance).to eq(transaction_history_instance)
    end
  end
end
