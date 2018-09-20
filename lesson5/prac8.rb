hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


hsh.each do |_, str_array|
  str_array.each do |a_string|
    vowels = a_string.split(//).select {|char| "aeiou".include? char}
    print vowels.join
  end
end