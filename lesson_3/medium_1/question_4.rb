#What happens when we modify an array while we are iterating over it?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#this will print 1 and 3 only. shift removes the first element of the array => 1
#now 2 is the first element, but the each will move to the next index position and remove => 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#pop removes the last elemetnt from the array. 
#since 3 and 4 will be removed after 2 loops, this will only return => 1 and 2

