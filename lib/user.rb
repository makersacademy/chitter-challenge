require 'bcrypt'
require 'pg'
require './lib/db_connection.rb'

class User
  attr_accessor :id, :username, :password
  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.create(username:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.new.run_query("INSERT INTO users (id, username, password) VALUES(DEFAULT, '#{username}', '#{encrypted_password}') RETURNING id, username, password;")
    User.new(id: result[0]["id"], username: result[0]["username"], password: result[0]["password"])
  end

  def self.find(id:)
    result = DatabaseConnection.new.run_query("SELECT * FROM users WHERE id = #{id};")
    return User.new(id: result[0]["id"], username: result[0]["username"], password: result[0]["password"])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.new.run_query("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    return User.new(id: result[0]['id'],username: result[0]['username'], password: result[0]['password'])
  end
end
