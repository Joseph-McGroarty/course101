def uuid_gen
  # create array of characters to get sample of
  sample_pool = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z)

  # return an array that samples 8-4-4-4-12 of those characters
  temp_array = sample_pool.sample(8) + ['-'] + sample_pool.sample(4) + ['-'] + sample_pool.sample(4) + ['-'] + sample_pool.sample(4) + ['-'] + sample_pool.sample(12)
  return temp_array.join
end

print uuid_gen