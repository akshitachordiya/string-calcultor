require_relative '../string_calculator'
require 'rspec'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  describe "#add" do
    context "when input is an empty string" do
      it "returns 0" do
        expect(string_calculator.add("")).to eq(0)
      end
    end

    context "when input is a string with length 1" do
      it "converts the string to integer and return it" do
        expect(string_calculator.add("5")).to eq(5)
      end
    end

    context "when input is a string containting positive nums sepearted by ',' " do
      it "adds all the numbers and return the sum" do
        expect(string_calculator.add("3,5,6,4")).to eq(18)
      end
    end

    context "when input has new line in it" do
      it 'handles new lines between numbers and adds them' do
        expect(string_calculator.add("1\n2,3")).to eq(6)
      end
    end

    context "support diffent delimeter" do
      it 'removes // and ' do
        expect(string_calculator.add("//;\n1;2")).to eq(3)
      end
    end
  end
end