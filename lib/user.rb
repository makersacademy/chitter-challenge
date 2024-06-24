require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;", [email, password]
    )
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1", [id]
    )
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
