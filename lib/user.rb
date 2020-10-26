require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(email:, password:, name:, username:)
    return if DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';").any?

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) 
      VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') 
      RETURNING id, email, name, username;")
      
    User.new(id: result[0]['id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")

    User.new(id: result[0]['id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return nil unless result.any? && BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end
end
