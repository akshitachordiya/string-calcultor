# require 'nokogiri'
# require 'open-uri'
require 'pry'


class StringCalculator
  
  def add(input)
    return 0 if input.empty?

    return input.to_i if input.length == 1
    delimiter, input = extract_numbers_and_delimeter(input)
    number_array = input.split(/#{delimiter}/).map(&:to_i)
    validate_no_negatives!(number_array)
    delimeter_parsed = delimiter[1..]
    delimeter_parsed == "*" ? number_array.reduce(:*) : number_array.sum
  end

  private

  def extract_numbers_and_delimeter(input)
    if input.start_with?("//")
      delimiter_line, numbers_str = input.split("\n", 2)
      custom_delimiter = Regexp.escape(delimiter_line[2..])
      [custom_delimiter, numbers_str]
    else
      [",|\n", input]
    end
  end

  def validate_no_negatives!(numbers)
    negatives = numbers.select(&:negative?)
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
  end
end