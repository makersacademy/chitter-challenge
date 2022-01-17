require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4)" \
      + "RETURNING id, username;",
      [name, username, email, encrypted_password]
    )
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    )
    
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], username: result[0]['username'])
  end
end
