require 'pg'
require './db_connection_setup'
require_relative 'db_connection'

class User

  attr_reader :id, :username, :email
  
  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    p result = DatabaseConnection.query(
    "INSERT INTO users (username, email, password) VALUES($1, $2, $3) 
    RETURNING id, username, email;",
    [username, email, password]
    )
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query(
    "SELECT * FROM users WHERE id = $1", 
    [id]
    )
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end