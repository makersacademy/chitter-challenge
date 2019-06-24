require_relative 'database_connection'

class User

  def self.create(username:, password:)
    result = DatabaseConnection.query("INSERT INTO chitter (username, text) VALUES('#{username}', '#{password}') RETURNING id, username, password;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end

  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

end