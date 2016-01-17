def tricky_method_two(a_string_param, an_array_param)

  puts "inside method before string sub. my_string id = #{a_string_param.object_id}"
  a_string_param.gsub!('pumpkins', 'rutabaga')
  puts "inside method after reassignment my_string id = #{a_string_param.object_id}"
  
  puts "inside method before reassignment my_array id = #{an_array_param.object_id}"
  an_array_param = ['pumpkins', 'rutabaga']
  puts "inside method after reassignment my_array id = #{an_array_param.object_id}"

end

my_string = "pumpkins"
my_array = ["pumpkins"]

puts "before method, my_string id = #{my_string.object_id}"
puts "before method, my_array id = #{my_array.object_id}"

tricky_method_two(my_string, my_array)

puts "after method, my_string id = #{my_string.object_id}"
puts "after method, my_array id = #{my_array.object_id}"

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#in this case the method cahnges the value of the string object
#when the array is reassigned, it creates a new object
#opposite of the previous exercise