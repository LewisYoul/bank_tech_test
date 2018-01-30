require 'balance'

describe Balance do

  subject { Balance.new }
  describe "#value" do
    it "should be instantiated with a value of 0" do
      expect(subject.value).to eq(0)
    end
  end
end
