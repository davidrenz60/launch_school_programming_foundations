# given this hash
my_hash = { first_name: "Joe", last_name: "Smith", married: true, birth_year: 1980 }

# return this nested array:
# => [["first_name", "Joe"], ["last_name", "Smith"], ["married", "true"], ["birth_year", "1980"]]

def convert_to_array(hash)
  hash.map { |key, value| [key.to_s, value.to_s] }
end

p convert_to_array(my_hash)

# not as concise, but works as well
def convert_to_array2(hash)
  array = hash.to_a
  array.map { |value| [value[0].to_s, value[1].to_s] }
end

convert_to_array2(my_hash)
