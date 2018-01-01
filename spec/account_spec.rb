require 'account'

describe Account do
  subject { Account.new }

  describe '#balance' do
    it 'returns an initial balance of zero' do
      expect(subject.balance).to eq(0)
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
