require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO chitter_users (email, password) VALUES($1, $2) RETURNING id, email;", [email, password]
    )
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
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
    )
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end