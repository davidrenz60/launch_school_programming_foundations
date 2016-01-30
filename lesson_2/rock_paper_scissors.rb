VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player1, player2)
  if win?(player1, player2)
    prompt("Player scores a point!\n ")
  elsif win?(player2, player1)
    prompt("Computer scores a point!\n ")
  else
    prompt("It's a tie!\n ")
  end
end

def letter_to_choice(letter)
  case letter
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

def update_score(scores, player, computer, player1_choice, player2_choice)
  if win?(player1_choice, player2_choice)
    scores[player] += 1
  elsif win?(player2_choice, player1_choice)
    scores[computer] += 1
  end
end

def initialize_scores
  { player: 0, computer: 0 }
end

def player_draw
  loop do
    answer = gets.chomp.downcase
    choice = letter_to_choice(answer)
    break choice if VALID_CHOICES.include?(choice)
    prompt("Please enter a valid selection")
  end
end

def computer_draw
  VALID_CHOICES.sample
end

def display_overall_winner(scores)
  if scores[:player] == 5
    prompt("Player wins!\n ")
  elsif scores[:computer] == 5
    prompt("Computer wins!\n ")
  end
end

def first_to_five?(scores)
  scores.value?(5)
end

def play_again?
  prompt("Would you like to play another round? Enter 'y' to continue")
  gets.chomp.downcase.start_with?('y')
end

opening_message = <<-MSG
-------------------------------------------------
Welcome to Rock, Paper, Scissors, Lizard, Spock!
-------------------------------------------------
   Enter 'r' for rock
         'p' for paper
         's' for spock
         'l' for lizard
         'sp' for spock
-------------------------------------------------

MSG

puts(opening_message)

loop do
  prompt("New game...first to 5 points wins\n ")
  scores = initialize_scores
  loop do
    prompt("Enter your selection")
    choice = player_draw
    computer_choice = computer_draw

    prompt("You chose: #{choice}")
    prompt("Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)
    update_score(scores, :player, :computer, choice, computer_choice)

    prompt("The score is: Player: #{scores[:player]}, Computer: #{scores[:computer]}")

    display_overall_winner(scores)
    break if first_to_five?(scores)
  end
  break unless play_again?
end

prompt("Thank you for playing. Goodbye!")
