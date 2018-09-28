def is_prime?(numb)
  an_arr = []
  
end

def second_attempt (first, second)
  (first..second).select do |number|
    (2...number).all? { |little| number % little != 0}
  end

  puts second_attempt(1, 12)
end