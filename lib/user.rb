require_relative 'database_connection'

class User

  def self.create(email:, password:, username:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, username) VALUES('#{email}', '#{password}', '#{username}') RETURNING id, email, username;")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])

  end

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

end
