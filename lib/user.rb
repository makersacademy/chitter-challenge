require 'bcrypt'
require_relative 'database_connection'

class User
  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:, password:)
    encryption = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, password) VALUES ('#{username}', '#{encryption}') RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.authentication(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], username: result[0]['username'])
  end

end
