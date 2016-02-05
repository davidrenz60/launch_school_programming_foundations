my_arr = %w(Joe Bob Amy David George Mary)

# return an array that has names longer than 3 letters
# => ["David", "George", "Mary"]

def longer_than_three(arr)
  arr.select do |name|
    name.chars.count > 3
  end
end

longer_than_three(my_arr)
