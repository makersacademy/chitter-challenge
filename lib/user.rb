require 'bcrypt'
require_relative './database_connection'

class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    # hashed_password = SCrypt::Password.create(password)
    hashed_password = BCrypt::Password.create(password)

    # p "#{hashed_password}"

    user = DatabaseConnection.query(
      "INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4) RETURNING id, email, name, username;", [email, hashed_password, name, username]
    )

    User.new(
      id: user[0]['id'],
      email: user[0]['email'],
      name: user[0]['name'],
      username: user[0]['username']
    )
  end

  def self.find(id:)
    return nil unless id

    user = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1", [id]
    )

    User.new(
      id: user[0]['id'],
      email: user[0]['email'],
      name: user[0]['name'],
      username: user[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    user = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )

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