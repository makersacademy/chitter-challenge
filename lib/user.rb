require_relative './database_connection'
require 'pg'

class User

  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, email:, username:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, email:, username:, password:)
    result = DatabaseConnection.query("INSERT INTO users ( email, password, name, username)
    VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")

    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'],
    username: result[0]['username'], password: result[0]['password'])
  end

  def self.log_in(username:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE username = '#{username}' and password = '#{password}';")

    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'],
    username: result[0]['username'], password: result[0]['password'])
  end

end
