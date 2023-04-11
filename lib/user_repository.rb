require_relative 'user'
require 'bcrypt'

class UserRepository
  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [new_user.name, new_user.username, new_user.email, encrypted_password]
  end
end
