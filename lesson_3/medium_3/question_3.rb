def tricky_method(a_string_param, an_array_param)
  puts "inside method before reassignment my_string id = #{a_string_param.object_id}"
  a_string_param += "rutabaga"
  puts "inside method after reassignment my_string id = #{a_string_param.object_id}"
  
  puts "inside method before << my_array id = #{an_array_param.object_id}"
  an_array_param << "rutabaga"
  puts "inside method after << my_array id = #{an_array_param.object_id}"
end



my_string = "pumpkins"
my_array = ["pumpkins"]

puts "before method, my_string id = #{my_string.object_id}"
puts "before method, my_array id = #{my_array.object_id}"

tricky_method(my_string, my_array)

puts "after method, my_string id = #{my_string.object_id}"
puts "after method, my_array id = #{my_array.object_id}"


puts "My string looks like this now: #{my_string}" # pumpkins
puts "My array looks like this now: #{my_array}" # ["pumpkins", rutabaga"]

# String#+= operation creates a new string object by REASSIGNMENT
# inside the method a new local variable points to the new object

# Array#<< operation uses the same array object that was passed to the method
# it will append the new value



