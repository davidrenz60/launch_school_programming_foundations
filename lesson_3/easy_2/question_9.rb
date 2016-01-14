#shorten names in the array to only 3 characters

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

#[0, 3] in this case means [starting_index, amount of spaces]