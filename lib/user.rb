require 'bcrypt'
require_relative 'database'

class User
  attr_reader :username
  def initialize(id, username, email)
    @id = id
    @username = username
    @email = email
  end

  def self.save(username, email, password)
    hashed_pass = BCrypt::Password.create(password)
    Database.execute('INSERT INTO users (username, email, hashed_password) VALUES ($1, $2, $3)', [username, email, hashed_pass])
  end

  def self.create(id)
    return false unless id
    result = Database.execute('SELECT * FROM users WHERE id = $1', [id]).to_a[0]
    user = self.new(result["id"], result["username"], result["email"])
  end
end
