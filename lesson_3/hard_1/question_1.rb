
if false
  greeting = “hello world”
end

greeting #=> nil

#normally a call to an uninitialized variable will throw an error
#if a variable is intialized within an if block, it will be set to nil