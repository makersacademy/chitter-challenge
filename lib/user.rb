require_relative './database_connection'
require 'bcrypt'

class User

  def self.create(email:, password:, handle:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, handle) VALUES('#{email}', '#{encrypted_password}', '#{handle}') RETURNING id, email, handle;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      handle: result[0]['handle']
    )
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      handle: result[0]['handle']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any? 
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      handle: result[0]['handle']
    )
  end

  attr_reader :email, :id, :handle

  def initialize(id:, email:, handle:)
    @id = id
    @email = email
    @handle = handle
  end
end
