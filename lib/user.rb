require 'bcrypt'
require 'database_connection'

class User

  def initialize(id:, name:, handle:, email:)
    @id = id
    @name = name
    @handle = handle
    @email = email
  end

  attr_reader :id, :name, :handle, :email

  def self.create(name:, handle:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, handle, email, password) VALUES ('#{name}', '#{handle}', '#{email}', '#{encrypted_password}') RETURNING id, name, handle, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], email: result[0]['email'])
  end
end
