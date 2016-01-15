#write a titleize method. Capitalize every new word in a string

def titleize(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

puts titleize("each word will be capitalized")

#note difference between each and map
#map will return the array constructed from the block
#each will evailuate but will return the original array