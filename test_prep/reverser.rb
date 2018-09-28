def reverse_a_string(str)
  new_str = ''
  counter = 0

  loop do
    new_str[counter] = str[-(counter + 1)]
    counter += 1
    break if counter == str.length
  end
  new_str
end

puts reverse_a_string("this is a string")
