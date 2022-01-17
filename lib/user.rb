require 'pg'
require_relative 'database_connection'

class User
  attr_reader :id, :username

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4) RETURNING id, username", [name, username, email, password])
          
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find_by(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1 AND password = $2", [username, password])
    result.first
  end
end
