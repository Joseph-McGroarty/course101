def remove_vowels(str)
  vowels = %w(a e i o u A E I O U)
  without_vowels = str.split(//).delete_if { |char| vowels.include?(char)}.join
  print without_vowels
end

remove_vowels("this is a string")