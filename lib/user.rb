require 'bcrypt'
require_relative 'database'
require 'sinatra/flash'

class User
  attr_reader :id, :username
  def initialize(id, username, email)
    @id = id
    @username = username
    @email = email
  end

  def self.save(username, email, password)
    return "Email already taken" unless self.unique_email?(email)
    return "Username already taken" unless self.unique_username?(username)
    return "Invalid password" unless self.valid_password?(password)
    hashed_pass = BCrypt::Password.create(password)
    Database.execute('INSERT INTO users (username, email, hashed_password) VALUES ($1, $2, $3)', [username, email, hashed_pass])
    true
  end

  def self.create(id)
    return false unless id
    result = Database.execute('SELECT * FROM users WHERE id = $1', [id]).to_a[0]
    user = self.new(result["id"], result["username"], result["email"])
  end

  def self.unique_email?(email)
    res = Database.execute('SELECT * FROM users WHERE email = $1', [email])
    res.to_a.length == 0
  end

  def self.unique_username?(username)
    res = Database.execute('SELECT * FROM users WHERE username = $1', [username])
    res.to_a.length == 0
  end

  def self.valid_password?(password)
    password.length > 5
  end
end
