require 'bcrypt'
require_relative 'database_connection'

class User
  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{name}','#{username}','#{email}','#{encrypted_password}') RETURNING id, name, username;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users where id = #{id};")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'])
  end

  attr_reader :id, :name, :username

  def initialize(id:, name:, username:)
    @id = id
    @name = name
    @username = username
  end
end
