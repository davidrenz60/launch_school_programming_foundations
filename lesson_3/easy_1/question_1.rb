numbers = [1, 2, 2, 3]
numbers.uniq  #This will return [1, 2, 3]

puts numbers  #will print [1, 2, 2, 3]

#Calling .uniq returns an array with only unique values
#The original object is not mutated so 1 2 2 3 is printed
#to_s is called when using puts
#p inspect and puts numbers.inspect would print the array as given 