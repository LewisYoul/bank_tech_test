require 'balance'

describe Balance do

  subject { Balance.new }

  describe "#amount" do
    it "should be instantiated with a amount of 0" do
      expect(subject.amount).to eq(0)
    end
  end

  describe "#credit_balance" do
    it "increases the balance amount" do
      subject.credit_balance(300)
      expect(subject.amount).to eq(300)
    end
  end

  describe "#debit_balance" do
    it "decreases the balance amount" do
      subject.credit_balance(300)
      subject.debit_balance(300)
      expect(subject.amount).to eq(0)
    end
  end
end
