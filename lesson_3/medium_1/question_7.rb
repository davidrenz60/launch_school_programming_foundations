
def fib(first_num, second_num, limit)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# the method was fixed by moving the limit variable to the arguments
# of the method. That way the method has access to the variable