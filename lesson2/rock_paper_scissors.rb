VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts "=> #{message}"
end

def win?(p1, p2)
  (p1 == 'rock' && p2 == 'scissors') ||
  (p1 == 'scissors' && p2 == 'paper') ||
  (p1 == 'paper' && p2 == 'rock')
end

def display_winner(user_choice, computer_choice)
  if win?(user_choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, user_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

score_tally = [["player: ", 0], ["computer: ", 0], ["tie: ", 0]]

def track_score(user_choice, computer_choice, score_tally)
  if win?(user_choice, computer_choice) then score_tally[0][1] += 1
  elsif win?(computer_choice, user_choice) then score_tally[1][1] += 1
  else score_tally[2][1] += 1
  end
end

user_choice = ''
loop do
  loop do
    prompt("Choose: #{VALID_CHOICES.join(' ,')}")
    user_choice = gets.chomp

    break if VALID_CHOICES.include?(user_choice)
    prompt("That's not a valid choice, please try again.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{user_choice}, computer chose #{computer_choice}.")

  display_winner(user_choice, computer_choice)

  track_score(user_choice, computer_choice, score_tally)

  prompt("The current score is")
  score_tally.each do |array|
    prompt(array)
  end

  prompt("Do you want to play again? y for yes, anything else for no")
  play_again_choice = gets.chomp
  break unless play_again_choice == "y"
end

prompt("Weenie.")