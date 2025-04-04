class StringCalculator
  
  def add(str)
    return 0 if str.empty?

    length_of_string = str.length
    return str.to_i if length_of_string == 1
    delimiter = /,|\n/
    if str.start_with?("//")
      delimiter_line, str = str.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end
    number_array = str.split(/#{delimiter}/).map(&:to_i)
    negatives = number_array.select(&:negative?)
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
    return number_array.sum
  end
end