#create a hash that gives the frequency of each letter in the string
#added downcase so upper/lower case not seperated

statement = "The Flintstones Rock"

result = {}
letters = ('a'..'z').to_a
letters.each do |letter|
  frequency = statement.downcase.scan(letter).count
  result[letter] = frequency if frequency > 0
end

puts result
