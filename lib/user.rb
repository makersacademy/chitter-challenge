require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :username, :email
  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user| 
      User.new(
        id: user['id'],
        username: user['username'], 
        email: user['email'], 
        password: user['password']
        )
    end
  end

  def self.create(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, email, password) 
      VALUES ('#{username}', '#{email}', '#{encrypted_password}') RETURNING *;"
    )
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      id: result[0]['id'], 
      username: result[0]['username'], 
      email: result[0]['email'],
      password: result[0]['password']
    )
  end
end
