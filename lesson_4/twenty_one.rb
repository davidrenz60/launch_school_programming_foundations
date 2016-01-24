SUITS = %w(S C D H)
CARDS = (2..10).to_a + %w(A K Q J)

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

def deal_hand!(player_hand, dealer_hand, deck)
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def display_opening_hands(player_hand, dealer_hand)
  prompt "You have: #{player_hand[0]} #{player_hand[1]} Total of #{total(player_hand)}"
  prompt "Dealer shows: #{dealer_hand[0]} [--------]"
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

def player_turn!(player_hand, deck)
  loop do
    choice = nil
    loop do
      prompt "Would you like to hit or stay? 'h' for hit or 's' for stay"
      choice = gets.chomp.downcase
      break if choice == "h" || choice == "s"
      prompt "Please enter 'h' or 's'"
    end

    if choice == "h"
      prompt "You hit"
      hit(player_hand, deck)
      prompt "You have: #{player_hand}. Total of #{total(player_hand)}"
    end

    break if choice == "s" || busted?(player_hand)
  end
end

def dealer_turn!(dealer_hand, deck)
  loop do
    break if busted?(dealer_hand) || total(dealer_hand) >= 17
    prompt "Dealer hits"
    hit(dealer_hand, deck)
    prompt "Dealer shows #{dealer_hand} Total of #{total(dealer_hand)}"
    prompt "Dealer stays!" if total(dealer_hand) >= 17 && !busted(dealer_hand)
  end
end

def play_again?
  prompt "Would you like to play again?"
  gets.chomp.downcase. start_with?('y')
end

def detect_winner(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :push
  end
end

def display_final_hands(player_hand, dealer_hand)
  puts <<~MSG 
    --------------------------------------------------
    "You have: #{player_hand[0]} #{player_hand[1]} Total of #{total(player_hand)}"
    "Dealer has: #{dealer_hand[0]} #{dealer_hand[1]} Total of #{total(dealer_hand)}"
    --------------------------------------------------
   MSG
end


def display_winner(player_hand, dealer_hand)
  result = detect_winner(player_hand, dealer_hand)
  case result
  when :player_busted
    prompt "You bust! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busts! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :push
    prompt "Push"
  end
end

opening_message

loop do
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  deal_hand!(player_hand, dealer_hand, deck)

  display_opening_hands(player_hand, dealer_hand)

  player_turn!(player_hand, deck)

  prompt "Dealer's turn:"

  dealer_turn!(dealer_hand, deck) unless busted?(player_hand)

  display_final_hands(player_hand, dealer_hand)

  display_winner(player_hand, dealer_hand)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"
