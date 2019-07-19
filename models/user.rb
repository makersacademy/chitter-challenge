require 'bcrypt'
require 'pg'
require_relative 'database_connection'
require './spec/database_connection_setup'

class User

  attr_reader :username, :email

  def initialize(username = nil, email = nil)
    @username = username
    @email = email
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
    User.new(result[0]['username'], result[0]['email'])
  end

  def self.find(user)
    return nil unless user
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{user.username}';")
    User.new(result[0]['username'], result[0]['email'])
  end

end