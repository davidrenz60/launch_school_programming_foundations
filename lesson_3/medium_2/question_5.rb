#what does this code output?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # => 34

#the answer variable is not changed by being passed into the method