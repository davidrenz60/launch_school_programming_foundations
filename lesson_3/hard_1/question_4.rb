# write a UUID generator method
# Each UUID consists of 32 hexadecimal characters, 
# typically broken into 5 sections like this 8-4-4-4-12 and 
# represented as a string.

def uuid_generator
  digits = (0..9).to_a + ("a".."f").to_a
  pattern = [8, 4, 4, 4, 12]
  uuid = ''
  pattern.each do |x|
    x.times { uuid << digits.sample.to_s } 
    uuid << '-' unless uuid.length == 36
  end
  uuid
end

puts uuid_generator


