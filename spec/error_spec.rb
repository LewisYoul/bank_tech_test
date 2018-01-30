require 'error'

describe Error do

  subject { Error.new }

  describe "#debit_checks" do
    it "throws an error if the amount is not an integer" do
      expect { subject.debit_checks(200, "string") }.to raise_error('Please enter an Integer')
    end
    it "throws an error if the withdrawal would result in negative balance" do
      expect { subject.debit_checks(200, 500) }.to raise_error('You have insufficient funds')
    end
    it "throws an error if the amount given is negative" do
      expect { subject.debit_checks(200, -400) }.to raise_error("You can't withdraw a negative")
    end
  end

  describe "#credit_checks" do
    it "throws an error if the amount is not an integer" do
      expect { subject.credit_checks(200, "string") }.to raise_error('Please enter an Integer')
    end
    it "throws an error if the amount given is negative" do
      expect { subject.credit_checks(200, -400) }.to raise_error("You can't credit a negative value")
    end
  end
end
