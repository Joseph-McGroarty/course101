arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |in_arr|
  in_arr.select do |num|
    num % 3 == 0
  end
end