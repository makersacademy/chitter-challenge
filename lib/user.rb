require './lib/database_connection'
require 'bcrypt'

class User
  include BCrypt

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.decrypt(password)
    Password.new(new)
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    sql = "INSERT INTO users (name, username, email, password) VALUES
    ('#{name}', '#{username}', '#{email}', '#{encrypted_password}')
    RETURNING id, name, username, email;"

    result = DatabaseConnection.query(sql).first
    User.new(id: result['id'], name: result['name'], username: result['username'], email: result['email'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'").first
    return unless result
    return unless BCrypt::Password.new(result['password']) == password
    User.new(id: result['id'], name: result['name'], username: result['username'], email: result['email'])
  end

  def self.find(user_id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user_id}'").first
    return unless result
    User.new(id: result['id'], name: result['name'], username: result['username'], email: result['email'])
  end

end