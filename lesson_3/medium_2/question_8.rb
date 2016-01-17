def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

#what will this output?

bar(foo) #=> "no"

#calling foo will always return "yes"
#if no parameter is given for bar, it will return "yes"
#passing "yes" into bar will result in "no" being returned

