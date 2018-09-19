statement = "The Flintstones Rock"

characters = statement.split(//)

the_hash = {}

characters.each do |letter|
  if the_hash.has_key?(letter)
    the_hash[letter] += 1
  else
    the_hash[letter] = 1
  end
end

puts the_hash