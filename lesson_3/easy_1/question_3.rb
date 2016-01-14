advice = "Few things in life are as important as house training your pet dinosaur."

#replace 'important' with 'urgent'

p advice.sub('important', 'urgent') #changes only the first instance
p advice.gsub('important', 'urgent') #changes all instances

p advice.sub(/important/, 'urgent') #can use regex in both methods