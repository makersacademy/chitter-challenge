require_relative './database_connection'
require 'bcrypt'

class User

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    # encrypt the plantext password
    BCrypt::Password.create(password)

    # insert the encrypted password into the database, 
    # instead of the plaintext one
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, name, username) 
      VALUES('#{email}', '#{password}','#{name}','#{username}') 
      RETURNING id, email, name, username;"
      )
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
      )
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
      )
  end
end
