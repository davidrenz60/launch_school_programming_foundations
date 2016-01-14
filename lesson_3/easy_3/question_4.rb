#shorten the sentence by removing everything after "house"

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index("house"))

#if advice.slice is called, "Few things in life are as important as "
#is returned, but the original advice variable is unchanged
