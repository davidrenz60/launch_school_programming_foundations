# given this hash:
people = { "Dave" => { gender: "male", married: true },
           "Jim" => { gender: "male", married: false },
           "Sara" => { gender: "female", married: true },
           "Ann" => { gender: "female", married: false },
           "Bob" => { gender: "male", married: true }
}

# write a method that will return an array of married males
# => ["Dave", "Bob"]

def married_males(hash)
  hash.select { |_, values| values[:gender] == "male" && values[:married] }.keys
end

married_males(people)
