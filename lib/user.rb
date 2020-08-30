require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :handle

  def initialize(id:, handle:)
    @id = id
    @handle = handle
  end

  def self.create(handle:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    entry = DatabaseConnection.query(
      "INSERT INTO users (handle, email, password) 
        VALUES('#{handle}', '#{email}', '#{encrypted_password}') 
       RETURNING id, handle;")

    User.new(id: entry[0]['id'], handle: entry[0]['handle'])
  end

  def self.find(id:)
    return nil unless id

    search = DatabaseConnection.query(
      "SELECT * 
        FROM users 
       WHERE id = #{id};")

    User.new(id: search[0]['id'], handle: search[0]['handle'])
  end
end
