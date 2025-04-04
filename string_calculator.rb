class StringCalculator
  
  def add(input)
    return 0 if input.empty?

    return input.to_i if input.length == 1
    delimiter = /,|\n/
    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end
    number_array = input.split(/#{delimiter}/).map(&:to_i)
    validate_no_negatives!(number_array)
    return number_array.sum
  end

  private

  def validate_no_negatives!(numbers)
    negatives = numbers.select(&:negative?)
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
  end
end