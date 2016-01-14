#find two methods to add "Four score and " to the beginning of the string

famous_words = "seven years ago..."

start = "Four score and "

famous_words.insert(0, start) #string is mutated

famous_words.prepend(start) #string is mutated
start << famous_words