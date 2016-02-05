letters = ("a".."z").to_a

# return an array that contains every 3rd letter of the alphabet

def every_third(arr)
  new_arr = []
  arr.each_with_index do |letter, idx|
    new_arr.push(letter) if (idx + 1) % 3 == 0
  end
  new_arr
end

every_third(letters)
