require_relative 'database_connection'
class User
  attr_reader :name, :username, :id, :email

  def initialize(id:, name:, username:, email:)
    @name = name
    @username = username
    @id = id
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end
end
