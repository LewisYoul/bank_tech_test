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
  let (:balance) { double(:balance, amount: 1000, credit_balance: "credit", debit_balance: "debit") }
  subject { Account.new(transaction_view_instance, balance) }

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
    it 'throws an error if a negative credit value is given' do
      expect { subject.add_funds(-300) }
        .to raise_error("You can't credit a negative value")
    end
    it 'throws an error if the value is not an integer' do
      expect { subject.add_funds(300.45) }
        .to raise_error('Please enter an Integer')
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
    it 'should throw an error if there are insufficient funds' do
      allow(balance).to receive(:amount).and_return(0)
      expect { subject.remove_funds(700) }
        .to raise_error('You have insufficient funds')
    end
    it 'should throw an error if there entered value is negative' do
      expect { subject.remove_funds(-700) }
        .to raise_error("You can't withdraw a negative")
    end
    it 'throws an error if the value is not an integer' do
      expect { subject.remove_funds(300.45) }
        .to raise_error('Please enter an Integer')
    end
  end

  describe '#print_statement' do
    it 'prints the transaction history to stdout' do
      expect(subject.print_statement).to eq('Test Print')
    end
  end
end
