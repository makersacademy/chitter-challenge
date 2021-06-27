require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :email, :name, :username
  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, name:, username:, password:)
    encrypted_password = BCrypt::Password.create(password)
    DatabaseConnection.query("INSERT INTO users (email, name, username, password) VALUES('#{email}', '#{name}', '#{username}', '#{encrypted_password}') RETURNING id, email, name, username, password;")
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    
    User.new(id: result.first['id'], email: result.first['email'], name: result.first['name'], username: result.first['username'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    user = User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end
end
