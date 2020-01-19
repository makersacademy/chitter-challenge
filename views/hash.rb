require 'digest/md5'

text = rand().to_s

user_colour = (Digest::MD5.hexdigest text)[0..6]
element = (user_colour[6]).to_i(16)
if element > 10
  index = 0
elsif element > 5 && element < 11
  index = 2
else
  index = 4
end
user_colour[index..index+2] = '00'

puts element
puts user_colour