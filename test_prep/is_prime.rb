def is_prime?(num)
  return false unless num > 1
  for divisor in (2..(num - 1))
   return false if num % divisor == 0
  end
  true
end

def a_prime_array(arr)
  arr.select { |element| is_prime?(element) }
end

def number_of_primes(arr)
  a_prime_array(arr).size
end

print number_of_primes([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
puts number_of_primes([1, 4, 8, -3])