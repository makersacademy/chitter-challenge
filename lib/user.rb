require 'pg'
require_relative 'database_connection'

class User

  attr_reader :name, :username, :email, :password

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(email, password, name, username)
    return false unless !email_in_use?(email) && !username_in_use?(username) && valid?(password) && valid?(name) 
    DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
  end

  def self.email_in_use?(email)
    DatabaseConnection.query("SELECT email FROM users WHERE email = ''#{email}''")
  end

  def self.username_in_use?(username)
    DatabaseConnection.query("SELECT username FROM users WHERE username = ''#{username}''")
  end

  def self.valid?(string)
    string.length >= 4
  end

end
