require_relative "../database_connection.rb"
require "bcrypt"

class User
  attr_reader :username
  def initialize(username)
    @username = username
  end
  def self.create(username, password)
    enc_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(("INSERT INTO Users (username, password) VALUES('#{username}', '#{enc_password}') RETURNING username;"))
    User.new(result[0]['username'])
  end
  def self.find_user(user)
    result = DatabaseConnection.query("SELECT * FROM Users WHERE username = '#{user}'")
    User.new(result[0]['username'])
  end
  def self.authenticate(username, entry_password)
    result = DatabaseConnection.query("SELECT * FROM Users WHERE username = '#{username}'")
    if result.any? == false || BCrypt::Password.new(result[0]['password']) != entry_password
      return false
    end
    User.new(result[0]['username'])
  end
  def self.already_exists?(username)
    result = DatabaseConnection.query("SELECT * FROM Users WHERE username = '#{username}'")
    result.any?
  end

end
