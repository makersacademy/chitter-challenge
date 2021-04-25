require_relative 'database_connection'

class User
  attr_reader :id, :username, :email
  
  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users(username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end
