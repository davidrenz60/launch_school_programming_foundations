#find if 42 is between 10 and 100

(10..100).include?(42)

#can also use cover?

(10..100).cover?(42)

#cover checks to see if argument can fit in as a list
#include checks to see if the argument is actually present in the range

