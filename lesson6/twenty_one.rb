deck_hash = {two_of_hearts: 2, three_of_hearts: 3, four_of_hearts: 4, five_of_hearts: 5, six_of_hearts: 6,
            seven_of_hearts: 7, eight_of_hearts: 8, nine_of_hearts: 9, ten_of_hearts: 10,
            jack_of_hearts: 10, queen_of_hearts: 10, king_of_hearts: 10,
            two_of_diamonds: 2, three_of_diamonds: 3, four_of_diamonds: 4, five_of_diamonds: 5, six_of_diamonds: 6,
            seven_of_diamonds: 7, eight_of_diamonds: 8, nine_of_diamonds: 9, ten_of_diamonds: 10,
            jack_of_diamonds: 10, queen_of_diamonds: 10, king_of_diamonds: 10,
            two_of_clubs: 2, three_of_clubs: 3, four_of_clubs: 4, five_of_clubs: 5, six_of_clubs: 6,
            seven_of_clubs: 7, eight_of_clubs: 8, nine_of_clubs: 9, ten_of_clubs: 10,
            jack_of_clubs: 10, queen_of_clubs: 10, king_of_clubs: 10,
            two_of_spades: 2, three_of_spades: 3, four_of_spades: 4, five_of_spades: 5, six_of_spades: 6,
            seven_of_spades: 7, eight_of_spades: 8, nine_of_spades: 9, ten_of_spades: 10,
            jack_of_spades: 10, queen_of_spades: 10, king_of_spades: 10}

player_hand = {}
dealer_hand = {}

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

def display_table(dlr, plyr)
  prompt "Dealer is showing #{dlr.keys.first} and has #{dlr.length} total cards."
  prompt "You have #{joiner(plyr.keys)}, which totals #{plyr.values.sum.to_s}."
end

def busted?(hand)
  if hand.values.sum > 21
    return true
  else
    return false
  end
end

prompt "Let's play 21. Shuffling cards..."
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
    prompt "Player busted, dealer wins!"
    break
  end
end