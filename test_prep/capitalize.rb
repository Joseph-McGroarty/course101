# split string into words array

# capitalize words

#put string back together

# return new string

def capitalizer(str)
  words = str.split(' ')
  words.map! { |word| word[0].capitalize + word[1..((word.length) -1)]}
  words.join(' ')
end

p capitalizer('four score and seven')
p capitalizer('javaScript')
p capitalizer('this is a "quoted" word')