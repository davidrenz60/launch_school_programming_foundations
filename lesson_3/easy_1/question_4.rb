numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) #this will delete the value at index 1
#=> [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]

numbers.delete(1) #this deletes the actual value 1
#=> [2, 3, 4, 5]

#both of these methods mutate the caller
