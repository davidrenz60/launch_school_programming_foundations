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
  system 'clear'
  prompt "Dealing..."
  prompt "You have: #{player_hand} Total of #{total(player_hand)}"
  prompt "Dealer shows: #{dealer_hand[0]}, [------]"
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

  adjust_for_aces(values, sum)
  sum
end

def adjust_for_aces(values, sum)
  values.count("A").times { sum -= 10 if sum > 21 }
end

def player_turn!(player_hand, deck)
  loop do
    choice = hit_or_stay
    if choice == 'h'
      prompt "You hit..."
      hit(player_hand, deck)
      break if busted?(player_hand)
      prompt "You have: #{player_hand}. Total of #{total(player_hand)}"
    else
      prompt "You choose to stay"
      break
    end
  end
end

def hit_or_stay
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    choice = gets.chomp.downcase
    break choice if ["h", "s"].include?(choice)
    prompt "Please enter 'h' or 's'"
  end
end

def dealer_turn!(dealer_hand, deck)
  prompt "Dealer's turn:"
  loop do
    prompt "Dealer stays!" if total(dealer_hand) >= 17 && !busted?(dealer_hand)
    break if busted?(dealer_hand) || total(dealer_hand) >= 17
    prompt "Dealer hits..."
    hit(dealer_hand, deck)
    prompt "Dealer has #{dealer_hand} Total of #{total(dealer_hand)}"
  end
end

def play_again?
  prompt "Would you like to play again? 'y' or 'n'"
  gets.chomp.downcase.start_with?('y')
end

def detect_winner(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if busted?(player_hand)
    :player_busted
  elsif busted?(dealer_hand)
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
  puts <<-MSG
  --------------------------------------------------
  "You have: #{player_hand} Total of #{total(player_hand)}"
  "Dealer has: #{dealer_hand} Total of #{total(dealer_hand)}"
  --------------------------------------------------
  MSG
end

def display_winner(player_hand, dealer_hand)
  display_final_hands(player_hand, dealer_hand)
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
prompt "Press return to start"
gets.chomp

loop do
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  deal_hand!(player_hand, dealer_hand, deck)

  display_opening_hands(player_hand, dealer_hand)

  player_turn!(player_hand, deck)

  if busted?(player_hand)
    display_winner(player_hand, dealer_hand)
    play_again? ? redo : break
  end

  dealer_turn!(dealer_hand, deck)

  display_winner(player_hand, dealer_hand)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"
