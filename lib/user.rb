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
    return false unless is_email?(email) && valid?(password) && valid?(name) && valid?(username) && valid?(password)
    DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
  end

  private

  def self.is_email?(email)
    email.chars.include?("@")
  end

  def self.valid?(string)
    string.length >= 4
  end

end
