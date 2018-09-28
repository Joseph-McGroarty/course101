def interweave(arr1, arr2)
  interwoven_arr = []
  counter = 0

  loop do
    interwoven_arr << arr1[counter]
    interwoven_arr << arr2[counter]
    break if counter == arr1.size - 1
    counter += 1
  end
  interwoven_arr
end

print interweave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])