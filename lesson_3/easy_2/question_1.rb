#find if 'Spot' has a value in the hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")
