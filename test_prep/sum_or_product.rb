def prompt(msg)
  puts "=> #{msg}"
end

def sum_or_product
  num = 0
  choice = ''
  loop do
    prompt "Enter an integer greater than 0."
    num = gets.chomp.to_i
    break if num > 0
    prompt "not a valid number, try again."
  end

  loop do
    prompt "Do you want to find sum or product? (enter sum or product)"
    choice = gets.chomp.downcase
    break if choice == 'sum' || choice == 'product'
    prompt "not a valid response, try again"
  end

  if choice == 'sum'
    counter = 1
    result = 0
    loop do
      result += counter
      break if counter == num
      counter += 1
    end
    prompt "The sum of the integers between 1 and #{num} is #{result}."
  end

  if choice == 'product'
    counter = 1
    result = 1
    loop do
      result *= counter
      break if counter == num
      counter += 1
    end
    prompt "The product of the integers between 1 and #{num} is #{result}."
  end
end

sum_or_product