require_relative 'database_connection'
require 'bcrypt'

class User
  include BCrypt
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end
 
  def self.create(name:, username:, email:, password:)
    hidden_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{hidden_password}') RETURNING id, name, username, email, password;")
    User.new(id: result.first['id'], name: result.first['name'], username: result.first['username'], email: result.first['email'], password: result.first['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result.first['id'], name: result.first['name'], username: result.first['username'], email: result.first['email'], password: result.first['password'])
  end
end
