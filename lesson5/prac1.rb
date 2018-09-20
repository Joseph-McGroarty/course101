arr = ['10', '11', '9', '7', '8']

arr2 = arr.sort_by do |num|
  num.to_i
end

print arr2