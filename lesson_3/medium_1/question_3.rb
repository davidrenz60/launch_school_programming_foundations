# puts "the value of 40 + 2 is " + (40 + 2) fix the error in this statement
# it gives an error since you can't concatenate a integer to a string
# two ways to fix:

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"



