require_relative './database_connection'
require 'bcrypt'

class User

  def self.create(options)
    password_hash = BCrypt::Password.create(options[:password])
    DatabaseConnection.query "INSERT INTO users(username, name, email, password) VALUES('#{options[:username]}', '#{options[:name]}', '#{options[:email]}', '#{password_hash}')"
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

end
