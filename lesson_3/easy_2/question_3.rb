#throw out people greater than 100 years old

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |key, value| value > 100 }

#can also use 
ages.keep_if { |key, value| value < 100 }