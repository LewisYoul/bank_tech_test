require 'balance'

describe Balance do

  let (:error) { double(:error, debit_checks: "stub", credit_checks: "stub") }

  subject { Balance.new(error) }

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
    it "calls error.credit_checks" do
      expect(error).to receive(:credit_checks).once
      subject.credit_balance(300)
    end
  end

  describe "#debit_balance" do
    it "decreases the balance amount" do
      subject.credit_balance(300)
      subject.debit_balance(300)
      expect(subject.amount).to eq(0)
    end
    it "calls error.debit_checks" do
      expect(error).to receive(:debit_checks).once
      subject.debit_balance(300)
    end
  end

  describe "#error" do
    it "is an instance of the error class" do
      expect(subject.error).to eq(error)
    end
  end
end
