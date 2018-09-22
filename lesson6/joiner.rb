def joiner_draft(an_array, opt_arg = '', joining_word = 'or')
  size_minus_one = an_array.size - 1
  joined_array = []
  if opt_arg != ''
    joined_array = an_array[0..size_minus_one] + [opt_arg] + [joining_word] + [an_array.last]
  else
    joined_array = an_array[0..size_minus_one] + [joining_word] + [an_array.last]
  end
  new_string = joined_array.join(', ')
  puts new_string
end

def joiner(an_array, opt_arg = ', ', joining_word = 'or')
  new_string_output = ''
  case an_array.size
  when 0 then ''
  when 1 then an_array.first
  when 2 then an_array.join(" #{joining_word} ")
  else 
    new_string_output = an_array[0..(an_array.size - 2)].join(opt_arg) + ", #{joining_word} " + an_array.last.to_s
  end
end

my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts joiner(my_array)
puts joiner(my_array)
puts joiner(my_array)