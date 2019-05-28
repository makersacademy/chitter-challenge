require_relative './database_connection'

class User
  def self.create(email:, password:, name:, username:)
    result = DatabaseConnection.query(
      "INSERT INTO users(
      email,
      password,
      name,
      username
      )
      VALUES(
      '#{email}',
      '#{password}',
      '#{name}',
      '#{username}'
      )
      RETURNING id, email, name, username;"
    )
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
    #  password: result[0]['password'],
      name: result[0]['name'],
      username: result[0]['username'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
     # password: result[0]['password'],
      name: result[0]['name'],
      username: result[0]['username'],
    )
  end

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

end
