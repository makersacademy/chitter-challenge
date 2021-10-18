require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(username:, firstname:, lastname:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (username, firstname, lastname, email, password) VALUES($1, $2, $3, $4, $5) RETURNING id, username, firstname, lastname, email;", [
        username, firstname, lastname, email, encrypted_password]
    )
    User.new(id: result[0]['id'], username: result[0]['username'], 
firstname: result[0]['firstname'], lastname: result[0]['lastname'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'], 
firstname: result[0]['firstname'], lastname: result[0]['lastname'], email: result[0]['email'])
  end

  attr_reader :id, :username, :firstname, :lastname, :email

  def initialize(id:, username:, firstname:, lastname:, email:)
    @id = id
    @username = username
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1", [username])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], username: result[0]['username'], 
firstname: result[0]['firstname'], lastname: result[0]['lastname'], email: result[0]['email'])
  end
end
