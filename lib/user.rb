require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :handle, :name

  def initialize(id:, handle:, name:)
    @id = id
    @handle = '@' + handle
    @name = name
  end

  def self.create(handle:, email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)
    entry = DatabaseConnection.query(
      "INSERT INTO users (handle, email, password, name) 
        VALUES('#{handle}', '#{email}', '#{encrypted_password}', '#{name}') 
       RETURNING id, handle, name;")

    User.new(id: entry[0]['id'], handle: entry[0]['handle'], name: entry[0]['name'])
  end

  def self.find(id:)
    return nil unless id

    search = DatabaseConnection.query(
      "SELECT * 
        FROM users 
       WHERE id = #{id};")

    User.new(id: search[0]['id'], handle: search[0]['handle'], name: search[0]['name'])
  end
end
