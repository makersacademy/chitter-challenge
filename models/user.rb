require 'bcrypt'
require 'pg'
require_relative 'database_connection'
require './spec/database_connection_setup'

class User

  attr_reader :username, :email

  def initialize(username = nil, email = nil, password = nil)
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| [user['username'], user['email']] }
  end

  def self.add(username, email, password)
    #encrypt the plaintext password
    encrypted_password = BCrypt::Password.create(password)
    #insert the encrypted password into the database, instead of the plaintext one
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) 
                                      VALUES('#{username}', '#{email}', '#{encrypted_password}') 
                                      RETURNING username, email;")
    User.new(result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find(user)
    return nil unless user
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{user.username}';")
    User.new(result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.check_username(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    User.new(result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.check_email(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    User.new(result[0]['username'], result[0]['email'], result[0]['password'])
  end

end