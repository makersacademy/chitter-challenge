require 'bcrypt'
require_relative 'database'

class User
  def initialize(username, email, password)
    @username = username
    @email = email
    @password = BCrypt::Password.create(password)
  end

  def save
    Database.execute('INSERT INTO users (username, email, hashed_password) VALUES ($1, $2, $3)', [@username, @email, @password])
  end
end
