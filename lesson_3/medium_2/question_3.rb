# refactor tricky_method to make this code easier to maintain

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


def better_method(string, array)
  string += "rutabaga"
  array += ["rutabaga"]

  return string, array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = better_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"