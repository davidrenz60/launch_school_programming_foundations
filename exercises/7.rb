my_hash = { a: 100, b: 50, c: 25, d: 75 }

# return the key that contains the smallest value
def find_key(hash)
  hash.key(hash.values.min)
end

find_key(my_hash)
