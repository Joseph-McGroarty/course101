def parenth_checker?(str)
  str_array = str.split(//)
  return false unless str_array.count('(') == str_array.count(')')

  counter = 0
  str_array.each do |char|
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
    end
    return false if counter < 0
  end
  true
end

puts parenth_checker?('this is ((a) string')
puts parenth_checker?('this should return() true')
puts parenth_checker?('still true')
puts parenth_checker?('and false ()))')
puts parenth_checker?(') should return false here(')