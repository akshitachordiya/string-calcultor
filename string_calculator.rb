class StringCalculator
  
  def add(str)
    return 0 if str.empty?
    length_of_string = str.length
    return str.to_i if length_of_string == 1
  end
end