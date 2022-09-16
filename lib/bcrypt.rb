# require 'bcrypt'

# my_password = BCrypt::Password.create("america1")
# my_password_2 = BCrypt::Password.create("america1")
#   #=> "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
# p my_password
# p my_password_2
# p my_password == "america1" #=> true
# p my_password_2 == 'america1' # => true
# p my_password == "newyork1" #=> false

# check_password = BCrypt::Password.new(my_password)
# p check_password
# p check_password == "america1"
# password = 'america1'    #=> true
# p my_password == 'america1' 
# p my_password == 'newyork1'