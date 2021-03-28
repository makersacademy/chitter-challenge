require 'pg'
require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :id, :name, :email 

  def initialize(id:, name:, email:)
    @id = id 
    @name = name
    @email = email 
  end 

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end 

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result [0]['name'], email: result[0]['email'])
  end 

  def self.authenticate(name:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE name = '#{name}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end 
end 