require './lib/databaseconnection'

class User

  def self.create(email:, username:, name:, password:)
    result = DatabaseConnection.query("INSERT INTO users (email, username, name, password) VALUES ('#{email}', '#{username}', '#{name}', '#{password}') RETURNING id, email;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email']
    )
  end

  attr_reader :email, :name, :username, :password, :id

  def initialize(email:, id:)
    @email = email
    @id = id
    @username = username
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      email: result[0]['email'],
      id: result[0]['id'],
    )
  end


end
