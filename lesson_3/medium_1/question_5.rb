def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

#bounus: number % dividend returns the integer remainderon division
#if it is zero, then the dividend is a factor

#bonus: this is so that the divisors array is returned. The last statement
#in a method is returned.
