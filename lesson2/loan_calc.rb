# get p (principle)
p = ''
apr = ''
loan_years = ''
loop do
  puts "Enter the loan ammount in dollars."
  p = gets.chomp.to_f
  break if p > 0
  puts "please enter a number."
end

# get apr
loop do
  puts "Enter the yearly interest rate. Use the percentage but don't include the percentage sign"
  apr = gets.chomp.to_f * 0.01
  break if apr > 0
  puts "please enter a number."
end 

# get loan time years
loop do
  puts "Enter the duration of the loan in years."
  loan_years = gets.chomp.to_f
  break if loan_years > 0
  puts "please enter a number."
end

# change loan time years to loan time months (n is duration in months)
n = loan_years * 12

# change apr to monthly rate (j is monthly interest rate)
j = apr / 12

# calc monthly morgage
m = p * (j / (1 - (1 + j)**(-n)))

# print monthly morgage
puts "Your monthly morgage payment is #{m}"