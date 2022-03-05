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
    return unless unique?(username)
    result = DatabaseConnection.query(
"INSERT INTO users (username, password) VALUES($1, $2) RETURNING id, username, password", [
  username, encrypted_password])
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id)
    return nil if id.nil?
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1",[username])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end
end

private

def unique?(username)
  return DatabaseConnection.query("SELECT EXISTS(SELECT 1 FROM users WHERE username = $1)", 
[username])[0]['exists'] == "f"
end
