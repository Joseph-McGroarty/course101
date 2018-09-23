BUST_OVER = 21
DEALER_HITS_TO = 17

deck_hash = {ace_of_hearts: 11, two_of_hearts: 2, three_of_hearts: 3, four_of_hearts: 4, five_of_hearts: 5, six_of_hearts: 6,
            seven_of_hearts: 7, eight_of_hearts: 8, nine_of_hearts: 9, ten_of_hearts: 10,
            jack_of_hearts: 10, queen_of_hearts: 10, king_of_hearts: 10,
            ace_of_diamonds: 11, two_of_diamonds: 2, three_of_diamonds: 3, four_of_diamonds: 4, five_of_diamonds: 5, six_of_diamonds: 6,
            seven_of_diamonds: 7, eight_of_diamonds: 8, nine_of_diamonds: 9, ten_of_diamonds: 10,
            jack_of_diamonds: 10, queen_of_diamonds: 10, king_of_diamonds: 10,
            ace_of_clubs: 11, two_of_clubs: 2, three_of_clubs: 3, four_of_clubs: 4, five_of_clubs: 5, six_of_clubs: 6,
            seven_of_clubs: 7, eight_of_clubs: 8, nine_of_clubs: 9, ten_of_clubs: 10,
            jack_of_clubs: 10, queen_of_clubs: 10, king_of_clubs: 10,
            ace_of_spades: 11, two_of_spades: 2, three_of_spades: 3, four_of_spades: 4, five_of_spades: 5, six_of_spades: 6,
            seven_of_spades: 7, eight_of_spades: 8, nine_of_spades: 9, ten_of_spades: 10,
            jack_of_spades: 10, queen_of_spades: 10, king_of_spades: 10}

player_hand = {}
dealer_hand = {}

player_wins = 0
dealer_wins = 0
ties = 0

def prompt(msg)
  puts "=> #{msg}"
end

def joiner(an_array, opt_arg = ', ', joining_word = 'and')
  case an_array.size
  when 0 then ''
  when 1 then an_array.first
  when 2 then an_array.join(" #{joining_word} ")
  else 
    an_array[0..(an_array.size - 2)].join(opt_arg) + ", #{joining_word} " + an_array.last.to_s
  end
end

def deal_a_card!(deck, deal_to)
  random_card_key = deck.keys.sample

  deal_to[random_card_key] = deck[random_card_key]

  deck.delete(random_card_key)
end

def hand_value(hand)
  sum = hand.values.sum

  hand.values.select { |value| value == 11}.count.times do
    sum -= 10 if sum > BUST_OVER
  end
  sum
end

def display_table(dlr, plyr)
  prompt "Dealer is showing #{dlr.keys.first} and has #{dlr.length} total cards."
  prompt "You have #{joiner(plyr.keys)}, which totals #{hand_value(plyr)}."
end

def busted?(hand)
  if hand_value(hand) > BUST_OVER
    true
  else
    false
  end
end

def expose_hands(plyr, dlr)
  prompt "You have #{joiner(plyr.keys)}, which totals #{hand_value(plyr)}."
    prompt "Dealer has #{joiner(dlr.keys)}, which totals #{hand_value(dlr)}."
end

def play_again?
  prompt "Play another hand? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  player_hand = {}
  dealer_hand = {}
  prompt "Let's play #{BUST_OVER}. Shuffling cards..."
  prompt "Dealing hands..."
  deal_a_card!(deck_hash, player_hand)
  deal_a_card!(deck_hash, dealer_hand)
  deal_a_card!(deck_hash, player_hand)
  deal_a_card!(deck_hash, dealer_hand)

  # player turn loop
  loop do
    display_table(dealer_hand, player_hand)
    prompt "Hit or stay?"
    player_hit_or_stay = gets.chomp.downcase
    if player_hit_or_stay == 'hit'
      deal_a_card!(deck_hash, player_hand)
    elsif player_hit_or_stay == 'stay'
      break
    else
      prompt "That's not a valid response, try again."
    end
    if busted?(player_hand)
      expose_hands(player_hand, dealer_hand)
      prompt "Player busted, dealer wins!"
      dealer_wins += 1
      break
    end
  end

  # dealer turn loop
  if busted?(player_hand) == false
    loop do
      if hand_value(dealer_hand) < DEALER_HITS_TO
        deal_a_card!(deck_hash, dealer_hand)
        prompt "Dealer hits."
      else
        prompt "Dealer stays."
        break
      end
      if busted?(dealer_hand)
        expose_hands(player_hand, dealer_hand)
        prompt "Dealer busted, player wins!"
        player_wins += 1
        break
      end
    end
  end

  # if no busts, compare hands and declare winner
  if busted?(player_hand) == false && busted?(dealer_hand) == false
    expose_hands(player_hand, dealer_hand)
    if hand_value(player_hand) > hand_value(dealer_hand)
      prompt "Player wins!"
      player_wins += 1
    elsif hand_value(player_hand) < hand_value(dealer_hand)
      prompt "Dealer wins!"
      dealer_wins += 1
    else
      prompt "It's a tie!"
      ties += 1
    end
  end
  if player_wins == 5
    prompt "Player has won 5 hands. Player wins game!"
    break
  elsif dealer_wins == 5
    prompt "Dealer has won 5 hands. Dealer wins game!"
    break
  end
  prompt "Dealer has won #{dealer_wins} hands, player has won #{player_wins} hands, and player and dealer have tied #{ties} hands."
  break unless play_again?
end
prompt "Thanks for playing!"