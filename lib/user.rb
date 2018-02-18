require_relative './database_connection'
require 'bcrypt'

class User

  def self.create(options)
    password_hash = BCrypt::Password.create(options[:password])
    user = DatabaseConnection.query "INSERT INTO users(username, name, email, password) VALUES('#{options[:username]}', '#{options[:name]}', '#{options[:email]}', '#{password_hash}') RETURNING id, username, name"
    new(user[0]['id'], user[0]['username'], user[0]['name'])
  end

  def self.all
    users = DatabaseConnection.query "SELECT * FROM users"
    users.map do |user|
      { id: user["id"],
        username: user['username'],
        name: user['name'],
        email: user['email'],
        password_hash: user['password']
      }
    end
  end

  attr_reader :id, :username, :password

  def initialize(id, username, name)
    @id = id
    @username = username
    @name = name
  end

end
