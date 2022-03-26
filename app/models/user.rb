require './app/database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    # Encrypt the plaintext password
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users(name, username, email, password) VALUES($1, $2, $3, $4) RETURNING id, name, username, email;", [name, username, email, encrypted_password]
    )

    User.new(
      id: result.first['id'], 
      name: result.first['name'], 
      username: result.first['username'], 
      email: result.first['email'])
  end

  def self.find(id) 
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1", [id])
    User.new(
      id: result.first['id'], 
      name: result.first['name'], 
      username: result.first['username'], 
      email: result.first['email'])
  end
end