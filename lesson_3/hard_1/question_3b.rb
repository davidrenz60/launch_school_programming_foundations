def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "one"
puts "two is: #{two}" #=> "two"
puts "three is: #{three}" #=> "three"