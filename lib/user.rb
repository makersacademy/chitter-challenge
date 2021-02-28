require_relative 'db_connection'
require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :email, :password, :name, :username

  def self.create(email:, password:, name:, username:)
    return nil if email_taken?(email) || username_taken?(username)

    encrypted_password = BCrypt::Password.create(password)
    result = DBConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id:)
    return nil if id.nil?

    result = DBConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.authenticate(username:, password:)
    result = DBConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return nil unless result.any?

    return nil unless BCrypt::Password.new(result[0]['password']) == password
    
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.username_taken?(username)
    return true if DBConnection.query("SELECT * FROM users WHERE username = '#{username}'").any?
  end

  def self.email_taken?(email)
    return true if DBConnection.query("SELECT * FROM users WHERE email = '#{email}'").any?
  end

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

end
