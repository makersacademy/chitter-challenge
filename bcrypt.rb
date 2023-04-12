require 'bcrypt'

password = BCrypt::Password.create("Just some silly")

puts password

decrypt = BCrypt::Password.new("$2a$12$anT7x2jJ4Ofj0qmCeahahORBu8NQI76lG2EPKDlUXIQgug0hp5KjG")

puts decrypt == "blue"