require 'bcrypt'
require 'pg'
require_relative './database_connection'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING username, email;")
    User.new(
      username: result[0]['username'],
      email: result[0]['email'],
    )
  end

  def self.find(username:)
    return nil unless username

    result = DatabaseConnection.query("SELECT * FROM users WHERE username = #{username}")
    User.new(
      username: result[0]['username'],
      email: result[0]['email'],
    )
  end

  attr_reader :username, :email

  def initialize(username:, email:)
    @username = username
    @email = email
  end
end
