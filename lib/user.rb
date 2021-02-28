require_relative 'db_connection'
require 'bcrypt'

class User
  attr_reader :id, :email, :password, :name, :username

  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    result = DBConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id:)
    return nil if id.nil?
    result = DBConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], name: result[0]['name'], username: result[0]['username'])
  end

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

end
