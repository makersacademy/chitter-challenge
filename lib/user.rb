require_relative './database_connection'
require 'bcrypt'

class User
  attr_reader :id, :username, :password

  def initialize(id:, username:, password: nil)
    @id = id
    @username = username
    @password = password
  end

  def self.create(username:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
"INSERT INTO users (username, password) VALUES($1, $2) RETURNING id, username, password", [
  username, encrypted_password])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.find(id)
    return nil if id.nil?
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end
end
