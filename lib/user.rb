require 'bcrypt'
require_relative './database_connection'

class User
  attr_reader :id, :email, :username
  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, password, email) VALUES('#{username}', '#{encrypted_password}', '#{email}') RETURNING username, password, id, email;")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end