def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def op_to_message(op)
  case op
  when "1" then "Adding"
  when "2" then "Subtracting"
  when "3" then "Multiplying"
  when "4" then "Dividing"
  end
end

num1 = ""
num2 = ""
loop do 
  # ask for two numbers
  loop do
    prompt("supply a number")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("that's not a valid number, try again")
    end
  end

  loop do 
    prompt("supply a second number")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("that's not a valid number, try again")
    end
  end

  # ask for opperation
  operator_prompt = <<-MSG
    What opperation would you like to perform?
    1 for add
    2 for subtract
    3 for multiply
    4 for divide
  MSG

  prompt(operator_prompt)
  opp = ''

  loop do
    opp = gets.chomp
    if %w(1 2 3 4).include?(opp)
      break
    else
      prompt("Must enter 1, 2, 3, or 4. Try again.")
    end
  end

  # perform opperation
  prompt(op_to_message(opp))
  result = case opp 
           when '1' then num1.to_i + num2.to_i
           when '2' then num1.to_i - num2.to_i
           when '3' then num1.to_i * num2.to_i
           when '4' then num1.to_f / num2.to_f
  end

  # output
  prompt("Result: #{result}")

  prompt("Do you want to perform another calculation? y to continue.")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("live long and prosper.")