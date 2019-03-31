# require_relative './database_connection'
require 'pg'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  # def self.all
  #   def self.all
  #     result = DatabaseConnection.query("SELECT * FROM users")
  #     result.map do |user|
  #       User.new(id: result['id'], name: result['name'], username: result['username'], email: result['email'], password: result['password'])
  #     end
  #   end
  # end

  def self.signup(name:, username:, email:, password:)
    connection = PG.connect(dbname: 'user_management')
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  # def self.signup(name:, username:, email:, password:)
  #   result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;")
  #   User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  # end

end