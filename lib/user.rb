require 'pg'

class User
  attr_reader :name, :email, :passowrd, :username

def initiliaze(name, email, password, username)
  @name = name
  @email = email
  @password = password
  @username = username
end

end
