require_relative './database_connection'
require 'bcrypt'

class User

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id
    @email = email
    @name = name 
  end

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)
    
    result = DatabaseConnection.query("INSERT INTO users (email, password, name) VALUES('#{email}', '#{encrypted_password}', '#{name}') RETURNING id, email, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    # return unless result.any?
    # return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

end