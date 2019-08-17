require './lib/databaseconnection'

class User

  def self.create(email:, password:, username:, name:)
    result = DatabaseConnection.query("INSERT INTO users (email, username, name, password) VALUES ('#{email}', '#{username}', '#{name}', '#{password}') RETURNING id, email, password, username, name;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password'],
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  attr_reader :email, :name, :username, :password, :id

  def initialize(email:, id:, password:, username:, name:)
    @email = email
    @id = id
    @password = password
    @username = username
    @name = name
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      email: result[0]['email'],
      id: result[0]['id'],
      password: result[0]['password'],
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], username: result[0]['username'], name: result[0]['name'])
  end
    # result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    # User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])


end
