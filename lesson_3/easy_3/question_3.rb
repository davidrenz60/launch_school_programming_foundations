#how to add multiple items to the array
#add "Dino" and "Hoppy"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino", "Hoppy") #appends given values
flintstones.concat(%w(Dino Hoppy)) #appends an array 

