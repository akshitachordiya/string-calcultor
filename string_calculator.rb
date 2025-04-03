class StringCalculator
  
  def add(str)
    return 0 if str.empty?

    length_of_string = str.length
    return str.to_i if length_of_string == 1

    str_arr = str.gsub("\n", ",").split(",").reject(&:empty?)
    num_arr = str_arr.map(&:to_i)
    return num_arr.sum
  end
end