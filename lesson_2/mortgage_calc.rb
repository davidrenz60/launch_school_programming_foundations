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

prompt("Welcome to the Mortgage Calculator!")

loop do
  prompt("What is the loan amount?")

  amt = ''
  loop do
    amt = gets.chomp
    if valid_num?(amt)
      break
    else
      prompt("Please enter a valid loan amount")
    end
  end

  prompt("What is the Annual Percentage Rate? Example: enter 2.8 for 2.8%")

  apr = ''
  loop do
    apr = gets.chomp
    if valid_num?(apr)
      break
    else
      prompt("Please enter a valid percentage")
    end
  end

  prompt("What is the duration of the loan? Enter the amount of years")

  years = ''
  loop do
    years = gets.chomp
    if integer?(years) && years.to_i >= 0
      break
    else
      prompt("Please enter a vaild number of years")
    end
  end

  monthly_interest = apr.to_f / 100 / 12
  months = years.to_i * 12
  amt = amt.to_f

  pmt = amt * (monthly_interest / (1 - ((1 + monthly_interest)**-months)))

  prompt("The monthly payment for this loan is $#{format('%2.2f', pmt)}")

  prompt("Would you like to calculate another loan? Enter 'Y' to continue")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the Mortgage Calculator!")
