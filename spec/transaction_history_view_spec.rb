require 'transaction_history_view'

describe TransactionHistoryView do
  let(:transaction_instance) { double(:transaction_instance, balance: 1000, credit: 1000, debit: 0, date: "2018-01-01")}
  let(:transaction_history_instance) { double(:transaction_history_instance, all_transactions: [transaction_instance]) }
  subject { TransactionHistoryView.new(transaction_history_instance) }

  describe '#transaction_history' do
    it 'returns an instance of TransactionHistory' do
      expect(subject.transaction_history_instance).to eq(transaction_history_instance)
    end
  end

  describe '#print_statement' do
    it 'prints out the statement' do
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n2018-01-01 || 1000 || 0 || 1000")
        .to_stdout
    end
  end
end
