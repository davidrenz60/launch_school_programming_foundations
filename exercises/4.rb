# add all the values in the array, accounting for strings
# => 35.5

numbers = [1, "2.5", 3, "5", 10.8, "13.2"]

def add_values(arr)
  arr.map { |num| num.to_f }.inject(:+)
end

p add_values(numbers)
