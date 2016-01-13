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

def display_results(player, computer)
  if win?(player, computer)
    prompt("Player scores a point!\n ")
  elsif win?(computer, player)
    prompt("Computer scores a point!\n ")
  else
    prompt("It's a tie!\n ")
  end
end

def letter_to_choice(letter)
  word = case letter
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
  word
end

def update_score(scores, player)
  scores[player] += 1
end

def check_score(scores)
  if scores[:player] == 5
    prompt("Player wins!\n ")
  elsif scores[:computer] == 5
    prompt("Computer wins!\n ")
  end
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
  scores = { player: 0, computer: 0 }

  loop do
    choice = ''

    loop do
      prompt("Enter your choice")

      choice = letter_to_choice(gets.chomp.downcase)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("Please enter a valid selection")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}")
    prompt("Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    update_score(scores, :player) if win?(choice, computer_choice)
    update_score(scores, :computer) if win?(computer_choice, choice)

    prompt("The score is: Player: #{scores[:player]}, Computer: #{scores[:computer]}")

    check_score(scores)

    break if scores.value?(5)
  end

  prompt("Would you like to play another round? Enter 'y' to continue")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
