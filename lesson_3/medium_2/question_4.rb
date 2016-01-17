#reverse the words of the sentence

sentence = "Humpty Dumpty sat on a wall."
puts sentence

reverse_sentence = sentence.split(/\W/).reverse.join(" ") + "."
puts reverse_sentence
