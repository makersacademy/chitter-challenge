require 'pg'
require_relative 'db_connection'

class User

  attr_reader :id, :username, :email
  
  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, email, password) VALUES($1, $2, $3) 
      RETURNING id, username, email;",
      [username, email, password]
      )
      User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end