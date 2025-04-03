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
  end
end