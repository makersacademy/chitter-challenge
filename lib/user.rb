require 'pg'
require_relative 'database_connection'

class User

  attr_reader :id, :email, :name, :username, :password

  def initialize(id, email, name, username, password)
    @id = id
    @email = email
    @name = name
    @username = username
    @password = password
  end

  def self.create(info)
    DatabaseConnection.query(
      "INSERT INTO users (email, name, username, password) VALUES (
        '#{info[:email]}',
        '#{info[:name]}',
        '#{info[:username]}',
        '#{info[:password]}')"
      )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(
      user['id'],
      user['email'],
      user['name'],
      user['username'],
      user['password']
      )
    }
  end
end
