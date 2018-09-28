def transpose(old_matrix)

  new_matrix = []
  old_matrix[0].size.times { new_matrix << []}

  old_matrix.each_with_index do |row, row_index|
    row.each_with_index do |el, column_index|
      new_matrix[column_index][row_index] = el
    end
  end
  new_matrix
  
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]