require 'account'

describe Account do
  let(:transaction) { double(:transaction) }
  let(:transaction_history_instance) { double(:transaction_history_instance) }
  let(:transaction_view_instance) do
    double(
      :transaction_view_instance,
      transaction_history_instance: transaction_history_instance,
      return_statement: 'Test Print'
    )
  end
  let (:error) { double(:error) }
  let (:balance) { double(:balance, amount: 1000, credit_balance: "credit", debit_balance: "debit") }
  subject { Account.new(transaction_view_instance, balance, error) }

  describe '#balance' do
    it 'returns a balance object' do
      expect(subject.balance).to eq(balance)
    end
  end

  describe '#transaction_history_view' do
    it 'returns an instance of TransactionHistoryView' do
      expect(subject.transaction_history_view).to eq(transaction_view_instance)
    end
  end

  describe '#add_funds' do
    it 'adds 500 to the account balance' do
      allow(transaction_history_instance).to receive(:add_funds).with(500, balance.amount)
      expect(subject.balance).to receive(:credit_balance).with(500)
      subject.add_funds(500)
    end
  end

  describe '#remove_funds' do
    it 'removes 500 from the account balance' do
      allow(transaction_history_instance).to receive(:add_funds).with(500, balance.amount)
      allow(transaction_history_instance).to receive(:remove_funds).with(500, balance.amount)
      subject.add_funds(500)
      expect(subject.balance).to receive(:debit_balance).with(500)
      subject.remove_funds(500)
    end
  end

  describe '#print_statement' do
    it 'prints the transaction history to stdout' do
      expect(subject.print_statement).to eq('Test Print')
    end
  end

  describe "#error" do
    it "is an instance of the error class" do
      expect(subject.error).to eq(error)
    end
  end
end
