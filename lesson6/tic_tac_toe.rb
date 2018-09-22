INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

player_win_num = 0
computer_win_num = 0
tie_num = 0

current_player = 'Player'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joiner(an_array, opt_arg = ', ', joining_word = 'or')
  case an_array.size
  when 0 then ''
  when 1 then an_array.first
  when 2 then an_array.join(" #{joining_word} ")
  else 
    an_array[0..(an_array.size - 2)].join(opt_arg) + ", #{joining_word} " + an_array.last.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joiner(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice. Try again."
  end
  brd[square] = PLAYER_MARKER
end

def offense_opportunity(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 2 && brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      correct_key_array = line.select { |key| brd[key] == INITIAL_MARKER}
      return correct_key_array[0]
    end
  end
  nil
end

def defense_opportunity(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2 && brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      correct_key_array = line.select { |key| brd[key] == INITIAL_MARKER}
      return correct_key_array[0]
    end
  end
  nil
end

def five_is_empty?(brd)
  empty_squares(brd).include?(5)
end

def computer_places_piece_strategically!(brd)
square = 0
  if offense_opportunity(brd)
    square = offense_opportunity(brd)
  elsif defense_opportunity(brd)
    square = defense_opportunity(brd)
  elsif five_is_empty?(brd)
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def alternate_player(player_is)
  if player_is == 'Player'
    'Computer'
  elsif player_is == 'Computer'
    'Player'
  end
end

def place_piece!(brd, player_is)
  if player_is == 'Player'
    player_places_piece!(brd)
  elsif player_is == 'Computer'
    computer_places_piece_strategically!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_win_num += 1
    elsif detect_winner(board) == 'Computer'
      computer_win_num += 1
    end
  else
    prompt "It's a tie!"
    tie_num += 1
  end

  prompt "Player has won #{player_win_num} matches, computer has won #{computer_win_num} matches, and player and computer have tied #{tie_num} times. First to 5 wins the game."
  if player_win_num == 5
    prompt "Player has won 5 matches. Player wins game!"
    break
  elsif computer_win_num == 5
    prompt "Computer has won 5 matches. Computer wins game!"
    break
  end
  prompt "Play another match? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
      
end
prompt "Thanks for playing."
