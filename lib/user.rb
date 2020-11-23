require_relative './database_connection'
require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    return false unless DatabaseConnection.query("SELECT COUNT(id) FROM users WHERE username='#{username.downcase}' OR email='#{email.downcase}';")[0]['count'].to_i.zero?

    return false if username.empty? || email.empty? || password.empty?

    salted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES ('#{username.downcase}', '#{email.downcase}', '#{salted_password}') RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username.downcase}';")
    return false unless result.any?

    return false unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end
