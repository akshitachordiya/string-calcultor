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
  end
end