require 'account'

describe Account do
  subject { Account.new }

  describe '#balance' do
    it 'returns an initial balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end
end
