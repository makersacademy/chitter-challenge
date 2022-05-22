require 'pg'
require 'bcrypt'
require_relative '../database_connection_setup.rb'

class User

  attr_reader :user_id, :username

  def initialize(username:, user_id:)
    @user_id = user_id
    @username = username
  end

  def self.create(username:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (username, password) VALUES ($1, $2) RETURNING id, username;",
      [username, encrypted_password]
    )
    User.new(username: result[0]['username'], user_id: result[0]['id'])
  end

  def self.find_by_username(username)
    result = DatabaseConnection.query(
      "SELECT id, username FROM users WHERE username IN ($1);",
      [username]
    )
    User.new(username: result[0]['username'], user_id: result[0]['id'])
  end

  def self.find_by_user_id(user_id)
    result = DatabaseConnection.query(
      "SELECT id, username FROM users WHERE id IN ($1);",
      [user_id]
    )
    User.new(username: result[0]['username'], user_id: result[0]['id'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE username IN ($1);",
      [username]
    )
    return false unless result.any?
    return false unless BCrypt::Password.new(result[0]['password']) == password
    true
  end

end