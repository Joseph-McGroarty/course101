words = "the flintstones rock"

def titlize(a_string)
  temp_array = a_string.split
  temp_array.map! do |word|
    word.capitalize
  end
  temp_array.join(" ")
end

print titlize(words)