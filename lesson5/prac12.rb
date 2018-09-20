arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hash_to_return = {}
arr.each do |inner_arr|
  hash_to_return[inner_arr[0]] = hash_to_return[inner_arr[1]]
end

hash_to_return