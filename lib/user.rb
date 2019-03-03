require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(name:, email:, username:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES('#{name}', '#{email}', '#{username}', '#{encrypted_password}') RETURNING id, name, email, username;")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      username: result[0]['username']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      username: result[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      username: result[0]['username']
    )
  end

  attr_reader :id, :name, :email, :username

  def initialize(id:, name:, email:, username:)
    @id = id
    @name = name
    @email = email
    @username = username
  end
end
