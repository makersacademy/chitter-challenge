require 'bcrypt'

# submitted_password = 'princess456'

# stored_password = BCrypt::Password.create('princess456')

# puts stored_password == 'princess456' # true
# puts stored_password == submitted_password # true

userpassword = 'banana123'
submitted_password = 'banana123'

stored_password = BCrypt::Password.new(userpassword)
  if stored_password == submitted_password
    puts 'true'
  else
    puts 'false'
  end