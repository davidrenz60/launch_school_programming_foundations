#find index of name that starts with Be

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name.start_with?("Be") }
#can also use

flintstones.index { |name| name[0, 2] == "Be" }



