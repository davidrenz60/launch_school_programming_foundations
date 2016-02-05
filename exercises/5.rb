my_hash = { a: [2, 4, 6], b: [5, 7, 9], c: [1, 3, 5], d: [4, 5, 7] }

# return the arrays that contain only odd numbers
# => [[5, 7, 9], [1, 3, 5]]

def odd_numbers(hash)
  hash.values.select do |arr|
    arr.all? { |num| num.odd? }
  end
end

odd_numbers(my_hash)
