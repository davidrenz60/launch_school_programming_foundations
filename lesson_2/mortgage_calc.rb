def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

def valid_num?(input)
  (integer?(input) || float?(input)) && input.to_f >= 0
end

def loan_entry
  loop do
    amount = gets.chomp
    break amount if valid_num?(amount)
    prompt("Please enter a valid loan amount")
  end
end

def interest_entry
  loop do
    interest = gets.chomp
    break interest if valid_num?(interest)
    prompt("Please enter a valid percentage")
  end
end

def years_entry
  loop do
    years = gets.chomp
    break years if integer?(years) && years.to_i >= 0
    prompt("Please enter a vaild number of years")
  end
end

def calculate_payment(amount, apr, years)
  monthly_interest = apr.to_f / 100 / 12
  months = years.to_i * 12
  amount.to_f * (monthly_interest / (1 - ((1 + monthly_interest)**-months)))
end

def start_over?
  prompt("Would you like to calculate another loan? Enter 'Y' to continue")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

prompt("Welcome to the Mortgage Calculator!")

loop do
  prompt("What is the amount of the loan?")
  amount = loan_entry

  prompt("What is the Annual Percentage Rate? Example: enter 2.8 for 2.8%")
  apr = interest_entry

  prompt("What is the duration of the loan? Enter the amount of years")
  years = years_entry

  monthly_payment = calculate_payment(amount, apr, years)

  prompt("The monthly payment for this loan is $#{format('%2.2f', monthly_payment)}")
  break unless start_over?
end

prompt("Thanks for using the Mortgage Calculator!")
