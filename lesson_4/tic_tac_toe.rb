FIRST_MOVE = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[3, 5, 7], [1, 5, 9]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "First to 5 points wins."
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
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
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = ''

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick square 5 if available
  if !square
    if empty_squares(brd).include?(5)
      square = 5
    end
  end

  # random
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  else
    nil
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

def first_to_five?(score)
  score.value?(5)
end

def display_winner(score, brd)
  prompt "#{detect_winner(brd)} wins the round! Game over." if first_to_five?(score)
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
    prompt "Please choose who will go first. ('p' for player or 'c' for computer)"
    answer = gets.chomp.downcase
    case answer
    when 'p'
      break 'player'
    when 'c'
      break 'computer'
    else
      prompt "Please enter a valid choice"
    end
  end
end

loop do
  score = initialize_score
  if FIRST_MOVE == 'choose'
    who_goes_first = choose_first_move
  end

  loop do
    board = initialize_board
    display_board(board)

    loop do
      display_board(board)
      display_score(score)

      # cpu foes first if set to computer
      if who_goes_first == 'computer'
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        display_board(board)
        display_score(score)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

      # player goes first by default
      else
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end

    display_board(board)
    update_score(score, board)
    display_score(score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} wins and scores a point!"
    else
      prompt "It's a tie!"
    end

    display_winner(score, board)
    score = reset_score(score)

    prompt "Press return to continue. Enter 'q' to quit or start a new round"
    answer = gets.chomp
    break if answer.downcase.start_with?('q')
  end

  prompt "Would you like to start a new round? ('y' or 'n' to exit)"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

prompt "Thanks for playing Tic-Tac-Toe. Goodbye!"
