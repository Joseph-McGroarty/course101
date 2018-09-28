# initialize a returning string
  # start w one NUMBERS already in the string
# num_of_operators.times do
  # use << to add OPERATORS.sample and NUMBERS.sample to returning_string
# return the returning string

def math_phrase(num_of_operators)
  numbers = %w(zero one two three four five six seven eight nine ten)
  operators = %w(plus minus times divided_by)

  returning_string = numbers.sample

  num_of_operators.times do
    returning_string << " #{operators.sample} #{numbers.sample}"
  end

  returning_string
end

def random_length
  random_number = (1..20).to_a.sample
  p math_phrase(random_number)
end

10.times do
  random_length
end