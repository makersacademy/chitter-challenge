require 'bcrypt'
require_relative './database_connection.rb'
class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, username:, name:)
    @id = id
    @email = email
    @username = username
    @name = name
  end

  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, email, username;")
    user.map do |peep|
      User.new(
        id: user[0]['id'],
        email: user[0]['email'],
        name: user[0]['name'],
        username: user[0]['username']
      )
    end
  end

  def self.find(id:)
    return nil unless username
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    user.map do |peep|
      User.new(
        id: user[0]['id'],
        email: user[0]['email'],
        name: user[0]['name'],
        username: user[0]['username']
      )
  end

  def self.authenticate(password:, username:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return unless user.any?
    return unless BCrypt::Password.new(user[0]['password']) == password
    User.new(
        id: user[0]['id'],
        email: user[0]['email'],
        name: user[0]['name'],
        username: user[0]['username']
      )
    end
  end

end
