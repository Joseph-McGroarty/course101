def substrings(str)
  return nil unless str.length >= 2
  counter = 0
  result = []
  sub_length_minus_one = 1
    loop do
      result << str[counter..counter + sub_length_minus_one]
      break if counter == (str.length - 1 - sub_length_minus_one)
      counter += 1
    end
    sub_length_minus_one += 1
  result
end

