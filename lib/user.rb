require_relative 'database_connection'
require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :username, :email, :name

  def initialize(id:, username:, email:, name:)
    @name = name
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
"INSERT INTO users (username, email, password, name) VALUES($1, $2, $3, $4) RETURNING id, username, email, name;", [
  username, email, encrypted_password, name])
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], 
name: result[0]['name'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1", [username])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], 
name: result[0]['name'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], 
name: result[0]['name'])
  end

end
