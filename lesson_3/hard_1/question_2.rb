greetings = { a: 'hi' }
informal_greeting = greetings[:a] #=> this will point informal greeting to the value of the key a
informal_greeting << ' there' #=> informal_greeting will now be 'hi there', but it will change the value
                              #of the original hash as well


puts informal_greeting  #=> "hi there"
puts greetings          #=> {:a=>"hi there"} 

# String#<< method will modify the object that calls it

# if you wanted to not modify the original object you could:

# make a clone of the value
# informal_greeting = greetings[:a].clone.

# use string concatenation. This makes an new string object, will not modify the original
# informal_greeting = informal_greeting + ' there'