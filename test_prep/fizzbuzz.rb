def fizzbuzz(start_num, end_num)
  fb_arr = []
  for num in (start_num..end_num)
    if num % 15 == 0
      fb_arr << "Fizzbuzz"
    elsif num % 3 == 0
      fb_arr << "Fizz"
    elsif num % 5 == 0
      fb_arr << "Buzz"
    else
      fb_arr << num
    end
  end
  puts fb_arr.join(', ')
end

fizzbuzz(10, 30)