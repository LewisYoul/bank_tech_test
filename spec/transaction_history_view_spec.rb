require 'transaction_history_view'

describe TransactionHistoryView do
  let(:transaction_instance) do
    double(
      :transaction_instance,
      balance: 1000,
      credit: 1000,
      debit: 0,
      date: '01/01/2018'
    )
  end

  let(:transaction_instance_2) do
    double(
      :transaction_instance,
      balance: 2000,
      credit: 1000,
      debit: 0,
      date: '04/02/2018'
    )
  end

  let(:transaction_history_instance) do
    double(
      :transaction_history_instance,
      all_transactions: [transaction_instance, transaction_instance_2]
    )
  end

  subject { TransactionHistoryView.new(transaction_history_instance) }

  describe '#transaction_history' do
    it 'returns an instance of TransactionHistory' do
      expect(subject.transaction_history_instance)
        .to eq(transaction_history_instance)
    end
  end

  describe '#return_statement' do
    it 'prints out the statement in reverse chronological order' do
      expect { subject.return_statement }.to output(
        "date || credit || debit || balance\n" \
        "04/02/2018 || 1000 || 0 || 2000\n" \
        '01/01/2018 || 1000 || 0 || 1000'
      ).to_stdout
    end
  end
end
