require 'bcrypt'
class User

  attr_accessor :id, :name, :email, :username, :password
  include BCrypt

end
