require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(username:, email:, password:)
  
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO chitter_users (username, email, password) VALUES($1, $2, $3) RETURNING username, id, email;", [username, email, encrypted_password]
    )
  
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM chitter_users WHERE id = $1", [id]
    )
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username'],
    )
  end

  def self.authenticate(email:, password:, username:)
    result = DatabaseConnection.query(
      "SELECT * FROM chitter_users WHERE email = $1", [email]
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end
end