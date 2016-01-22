INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[3, 5, 7], [1, 5, 9]]

def prompt(msg)
  puts "=> #{msg}"
end

def opening_message
  system 'clear'
  puts <<~MSG
    ---------------------------

    **Welcome to Tic-Tac-Toe!**

    ---------------------------

    *First player to 5 points wins.
    *Player is '#{PLAYER_MARKER}. Computer is '#{COMPUTER_MARKER}'.
    *enter choice by square number:

        | 1 | 2 | 3 |
        -------------
        | 4 | 5 | 6 |
        -------------
        | 7 | 8 | 9 |


  MSG
end

def display_board(brd)
  system 'clear'
  puts ""
  puts <<~MSG
         |     |
      #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
         |     |
    -----+-----+-----
         |     |
      #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
         |     |
    -----+-----+-----
         |     |
      #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
         |     |

  MSG
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def display_score(score)
  prompt "The score is Player: #{score[:player]}. Computer: #{score[:computer]}."
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}."
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_offense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = ''
  square = computer_offense(brd, square)
  square = computer_defense(brd, square) unless square
  square = 5 if !square && empty_squares(brd).include?(5)
  square = empty_squares(brd).sample unless square
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  current_player == 'computer' ? computer_places_piece!(brd) : player_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 'computer' ? 'player' : 'computer'
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def update_score(score, brd)
  score[:player] += 1 if detect_winner(brd) == "Player"
  score[:computer] += 1 if detect_winner(brd) == "Computer"
end

def display_round_winner(brd)
  someone_won?(brd) ? (prompt "#{detect_winner(brd)} wins the round!") : (prompt "It's a tie!")
end

def first_to_five?(score)
  score.value?(5)
end

def display_game_winner(score, brd)
  prompt "The game is over. #{detect_winner(brd)} wins!" if first_to_five?(score)
end

def reset_score(score)
  first_to_five?(score) ? initialize_score : score
end

def joinor(array, mark=', ', word='or')
  array[-1] = "#{word} #{array.last}" if array.length > 1
  array.join(mark)
end

def choose_first_move
  loop do
    prompt "Enter who will choose first: ('p' for player or 'c' for computer)."
    answer = gets.chomp.downcase
    case answer
    when 'p'
      break 'player'
    when 'c'
      break 'computer'
    else
      prompt "Please enter a valid choice."
    end
  end
end

def continue?
  prompt "Press return to continue. Enter 'q' to quit or start a new game."
  gets.chomp.downcase.start_with?('q')
end

def new_game?
  prompt "Enter 'q' to quit or press return to start a new game."
  gets.chomp.downcase.start_with?('q')
end

opening_message

loop do
  score = initialize_score
  current_player = choose_first_move

  loop do
    board = initialize_board
    display_board(board)

    loop do
      display_board(board)
      display_score(score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    update_score(score, board)
    display_score(score)

    display_round_winner(board)

    display_game_winner(score, board)
    score = reset_score(score)
    break if continue?
  end

  break if new_game?
end

prompt "Thanks for playing Tic-Tac-Toe. Goodbye!"
