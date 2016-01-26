SUITS = %w(S C D H)
CARDS = (2..10).to_a + %w(A K Q J)
WINNING_SCORE = 21
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def opening_message
  system 'clear'
  prompt "Welcome to #{WINNING_SCORE}!"
  prompt "First player to 5 points wins."
end

def initialize_score
  { player: 0, dealer: 0 }
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

def display_opening_hands(player_hand, dealer_hand, score)
  system 'clear'
  display_score(score)
  prompt "Dealing..."
  prompt "You have: #{player_hand} Total of #{total(player_hand)}"
  prompt "Dealer shows: #{dealer_hand[0]}, [------]"
end

def hit(cards, deck)
  cards << deck.pop
end

def busted?(cards)
  total(cards) > WINNING_SCORE
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

  sum = adjust_for_aces(values, sum)
end

def adjust_for_aces(values, sum)
  values.count("A").times do
    sum -= 10 if sum > WINNING_SCORE
  end
  sum
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
    prompt "Dealer stays!" if total(dealer_hand) >= DEALER_STAY && !busted?(dealer_hand)
    break if busted?(dealer_hand) || total(dealer_hand) >= DEALER_STAY
    prompt "Dealer hits..."
    hit(dealer_hand, deck)
    prompt "Dealer has #{dealer_hand} Total of #{total(dealer_hand)}"
  end
end

def play_again?
  prompt "Would you like to play again? 'y' or 'n'"
  gets.chomp.downcase.start_with?('y')
end

def update_score(score, player_hand, dealer_hand)
  case detect_winner(player_hand, dealer_hand)
  when :dealer_bust, :player
    score[:player] += 1
  when :player_bust, :dealer
    score[:dealer] += 1
  end
end

def display_score(score)
  prompt "The score is: You: #{score[:player]}. Dealer: #{score[:dealer]}"
end

def detect_winner(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if busted?(player_hand)
    :player_bust
  elsif busted?(dealer_hand)
    :dealer_bust
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :push
  end
end

def first_to_five?(score)
  score.value?(5)
end

def display_final_hands(player_hand, dealer_hand)
  puts <<~MSG
  --------------------------------------------------
  "You have: #{player_hand} Total of #{total(player_hand)}"
  "Dealer has: #{dealer_hand} Total of #{total(dealer_hand)}"
  --------------------------------------------------
  MSG
end

def display_results(player_hand, dealer_hand)
  display_final_hands(player_hand, dealer_hand)
  result = detect_winner(player_hand, dealer_hand)
  prompt case result
         when :player_bust
           "You bust! Dealer wins!"
         when :dealer_bust
           "Dealer busts! You win!"
         when :player
           "You win!"
         when :dealer
           "Dealer wins!"
         when :push
           "Push!"
         end
end

def display_overall_winner(score)
  if score[:player] == 5
    prompt "You are first to 5 points. You win!!"
  else
    prompt "Dealer is first to 5 points. Dealer wins!!"
  end
end

opening_message
prompt "Press return to start"
gets.chomp

score = initialize_score

loop do
  deck = initialize_deck

  player_hand = []
  dealer_hand = []
  deal_hand!(player_hand, dealer_hand, deck)

  display_opening_hands(player_hand, dealer_hand, score)

  player_turn!(player_hand, deck)

  dealer_turn!(dealer_hand, deck) unless busted?(player_hand)

  display_results(player_hand, dealer_hand)
  update_score(score, player_hand, dealer_hand)

  if first_to_five?(score)
    display_score(score)
    display_overall_winner(score)
    score = initialize_score
  end

  break unless play_again?
end

prompt "Thanks for playing #{WINNING_SCORE}!"
