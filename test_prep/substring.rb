def substring(str, starting_index, ending_index = starting_index)
  output_string = ''
  for char_index in (starting_index..ending_index)
    break if char_index > str.length - 1
    output_string << str[char_index]
  end
  output_string
end

def all_subs_retry(str)
  array_of_substrings = []
  firsts = []
  lengths_minus_one = []
  for fir in (0..(str.length - 2))
    firsts << fir
  end
  for length_minuses in (1..(str.length - 1))
    lengths_minus_one << length_minuses
  end

  firsts.each do |first_num|
    lengths_minus_one.each do |ending_num|
      if substring(str, first_num, ending_num).length.between?(2, str.length)
        array_of_substrings << substring(str, first_num, ending_num)
      end
    end
  end
  array_of_substrings
end

def subs_again(str)
  all_subs_retry(str).select do |substring|
    if substring.length.even?
      substring[0..(substring.length / 2 - 1)] == substring[(substring.length / 2)..(substring.length - 1)].reverse
    elsif substring.length.odd?
      substring[0..(substring.length / 2 - 1)] == substring[(substring.length / 2 + 1)..(substring.length - 1)].reverse
    end
  end
end

def largest_palendrome(str)
  subs_again(str).sort_by! { |pal| pal.length}.last
end

p largest_palendrome('wow abba hooooh owwo')