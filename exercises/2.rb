# given this array:
my_array = [["first_name", "Joe"], ["last_name", "Smith"], ["married", true], ["birth_year", 1980]]

# return the following hash, where first item in each array is the key and second is the value
# convert the keys to symbols
# => {:first_name=>"Joe", :last_name=>"Smith", :married=>true, :birth_year=>1980}


def convert_to_hash(array)
  array.map { |key, value| [key.to_sym, value] }.to_h
end

convert_to_hash(my_array)

# another method

def convert_to_hash2(array)
  hash = {}
  array.each do |value|
    hash[value[0].to_sym] = value[1]
  end
  hash
end

convert_to_hash2(my_array)
