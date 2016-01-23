SUITS = ['S', 'C', 'H', 'D']
CARDS = ['A', 'K', 'Q', 'J', '10', '9', '8'] +
        ['7', '6', '5', '4', '3', '2']

def prompt(msg)
  puts "=> #{msg}"
end

def opening_message
  system 'clear'
  prompt "Welcome to Twenty-One!"
end

def initialize_deck
  SUITS.product(CARDS).shuffle
end

def hit(cards, deck)
  cards << deck.pop
end

def busted?(cards)
  total(cards) > 21
end

def total(cards)
  values = cards.map { |card| card[1] }
  sum = 0

  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.count("A").times do
    sum -= 10 if sum > 21
  end

  sum
end

def play_again?
  prompt "Would you like to play again?"
  gets.chomp.downcase. start_with?('y')
end

def detect_winner(player_hand, computer_hand)
  player_total = total(player_hand)
  computer_total = total(computer_hand)

  if player_total > 21
    :player_busted
  elsif computer_total > 21
    :computer_busted
  elsif player_total > computer_total
    :player
  elsif player_total < computer_total
    :computer
  else
    :push
  end
end

def display_winner(player_hand, computer_hand)
  result = detect_winner(player_hand, computer_hand)
  case result
  when :player_busted
    prompt "You bust! Dealer wins!"
  when :computer_busted
    prompt "Dealer busts! You win!"
  when :player
    prompt "You win!"
  when :computer
    prompt "Dealer wins!"
  when :push
    prompt "Push"
  end
end

opening_message

loop do
  deck = initialize_deck

  player_hand = []
  computer_hand = []
  2.times do
    player_hand << deck.pop
    computer_hand << deck.pop
  end

  prompt "You have: #{player_hand[0]} #{player_hand[1]} Total of #{total(player_hand)}"
  prompt "Dealer shows: #{computer_hand[0]} [--------]"

  loop do
    player_turn = nil

    loop do
      prompt "Would you like to hit or stay? 'h' for hit or 's' for stay"
      player_turn = gets.chomp.downcase
      break if player_turn == "h" || player_turn == "s"
      prompt "please enter 'h' or 's'"
    end

    if player_turn == "h"
      hit(player_hand, deck)
      prompt "You have: #{player_hand}. Total of #{total(player_hand)}"
    end

    break if player_turn == "s" || busted?(player_hand)
  end

  if busted?(player_hand)
    display_winner(player_hand, computer_hand)
    play_again? ? next : break
  else
    prompt "You choose to stay at #{total(player_hand)}"
  end

  prompt "Dealer's turn:"

  loop do
    break if busted?(computer_hand) || total(computer_hand) >= 17
    prompt "Dealer hits"
    hit(computer_hand, deck)
    prompt "Dealer shows #{computer_hand} Total of #{total(computer_hand)}"
  end

  if busted?(computer_hand)
    display_winner(player_hand, computer_hand)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(computer_hand)}"
  end

  prompt "You have #{total(player_hand)}"
  prompt "Dealer has #{total(computer_hand)}"

  display_winner(player_hand, computer_hand)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"
