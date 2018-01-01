require 'transaction'

describe Transaction do
  subject { Transaction.new }

  describe 'instantiation' do
    it { is_expected.to be_an_instance_of(Transaction) }
  end
  describe '#credit' do

  end
end
