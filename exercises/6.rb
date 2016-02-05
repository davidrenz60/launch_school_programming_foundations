sentence = "this is an example."

# return a hash where the key is the order of the words in the string
# => { 1 => "this", 2 => "is", 3 => "an", 4 => "example" }

def word_order(str)
  hash = {}
  str.split(/\W/).each_with_index do |word, idx|
    hash[idx + 1] = word
  end
  hash
end

word_order(sentence)

# same thing but order words alphabetically

def alphabetical_order(str)
  hash = {}
  str.split(/\W/).sort.each_with_index do |word, idx|
    hash[idx + 1] = word
  end
  hash
end

alphabetical_order(sentence)
