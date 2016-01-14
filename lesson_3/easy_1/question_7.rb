def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep #=> "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

eval(how_deep) #=> 42

#eval seems to replace 'number' in the how_deep string with its variable (2), 
#then evaluate the add_eight method 5 times 