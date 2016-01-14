flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

#make a hash with names as keys, and values are position in the array

hash = {}
flintstones.each_with_index do |name, idx|
  hash[name] = idx
end

puts hash