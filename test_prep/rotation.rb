# take an array as an argument (input_arr)
# return new array of form input_arr[1..(last el index)] + inpu_arr[0]
# non-mutating

def rotate_array(input_arr)
  input_arr[1..(input_arr.size - 1)] + [input_arr[0]]
end

# rightmost digits

# input_arr[0..(el before one to be rotated)] + (call rotate method on only the piece of array w however many digits to rotate)


def rotate_rightmost_digits(input_num, num_to_rotate)
  input_arr = input_num.to_s.split(//).map { |el| el.to_i }
  output_arr = input_arr[0..-(num_to_rotate + 1)] + rotate_array(input_arr[-num_to_rotate..-1])
  output_arr.join.to_i
end

# loop w counter calling rotate right most on input w size - 1 to 2 as rot_nums
# may need to create extra var to catch result w/o mutating caller

def max_rotation(input_num)
  counter = input_num.to_s.length
  return_value = input_num
  loop do
    return_value = rotate_rightmost_digits(return_value, counter)
    break if counter <= 2
    counter -= 1
  end
  return_value
end

p max_rotation(735291)