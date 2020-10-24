require 'bcrypt'
require_relative './database_connection'

class User

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING name, id, email;")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    return nil if id.nil?
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    user = User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email, :name

  def initialize(name:, id:, email:)
    @name = name
    @id = id
    @email = email
  end
end
