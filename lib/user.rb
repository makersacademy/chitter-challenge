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
    DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
  end

end
