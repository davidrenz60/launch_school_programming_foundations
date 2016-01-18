# fix this code. Make suure it is valid IP address with 
# 4 dot seperated numbers

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break if !is_a_number?(word)
#   end
#   return true
# end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
    return false unless dot_separated_words.length == 4
    
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
    return false unless is_a_number?(word)
    end 
  end
  true
end