require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt(messages('greeting', LANGUAGE) + "#{name}!")

loop do
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = gets.chomp
    if number?(number1)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('operator_error', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operator)}" + messages('operator_working', LANGUAGE))

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(messages('result', LANGUAGE) + "#{result}")

  prompt(messages('continue', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))
