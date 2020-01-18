require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email
  
  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    user = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, name, username, email;")
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'])
  end

  def self.find(id:)
    return nil unless id

    user = DatabaseConnection.query("SELECT id, name, username, email FROM users WHERE id=#{id}")
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT id, name, username, email FROM users WHERE email='#{email}'")
    return nil unless result.any?

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end
end
