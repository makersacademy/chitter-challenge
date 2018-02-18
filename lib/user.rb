require_relative './database_connection'
require 'bcrypt'

class User

  def self.create(options)
    password_hash = BCrypt::Password.create(options[:password])
    user = DatabaseConnection.query "INSERT INTO users(username, name, email, password) VALUES('#{options[:username]}', '#{options[:name]}', '#{options[:email]}', '#{password_hash}') RETURNING id, username, name, password"
    new(user[0]['id'],
        user[0]['username'],
        user[0]['name'],
        BCrypt::Password.new(user[0]['password']))
  end

  def self.all
    users = DatabaseConnection.query "SELECT * FROM users"
    users.map do |user|
      new(user['id'],
          user['username'],
          user['name'],
          BCrypt::Password.new(user['password']))
    end
  end

  def self.find_by_username(username)
    p username
    user = DatabaseConnection.query "SELECT * FROM users WHERE username='#{username}'"
    p user.check
    new(user[0]['id'],
        user[0]['username'],
        user[0]['name'],
        BCrypt::Password.new(user[0]['password']))

  end

  attr_reader :id, :username, :name, :password

  def initialize(id, username, name, password)
    @id = id
    @username = username
    @name = name
    @password = password
  end

end
