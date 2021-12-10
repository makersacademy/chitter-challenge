require_relative './database_connection'

class User
  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.create(username:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, password) VALUES($1, $2) RETURNING username, password", [username, password])
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end

end