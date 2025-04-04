class StringCalculator
  
  def add(str)
    return 0 if str.empty?

    return str.to_i if str.length == 1
    delimiter = /,|\n/
    if str.start_with?("//")
      delimiter_line, str = str.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end
    number_array = str.split(/#{delimiter}/).map(&:to_i)
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