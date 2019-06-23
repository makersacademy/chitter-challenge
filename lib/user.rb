require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :name, :email, :username

  def initialize(name, email, username)
    @name = name
    @email = email
    @username = username  
  end

  def self.register(name, email, username, password)

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) 
                                        VALUES ('#{name}', '#{email}', '#{username}', '#{encrypted_password}')
                                          RETURNING name, email, username;")
    User.new(result[0]['name'], result[0]['email'], result[0]['username'])
  end

  def self.authenticate(username, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    User.new(result[0]['name'], result[0]['email'], result[0]['username'] )
  end

end