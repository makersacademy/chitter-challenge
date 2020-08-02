require_relative 'database_connection'

class User
  attr_reader :id, :username, :email, :password
  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user| 
      User.new(
        id: user['id'],
        username: user['username'], 
        email: user['email'], 
        password: user['password']
        )
    end
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, email, password) 
      VALUES ('#{username}', '#{email}', '#{password}') RETURNING *;"
    )
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end
end
