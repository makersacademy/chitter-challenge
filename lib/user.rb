require './lib/database_connection'
require './lib/database_setup'
require 'bcrypt'

class User
  attr_reader :id, :email, :username, :name

  def initialize(id:, email:, username:, name:)
    @id = id
    @email = email
    @username = username
    @name = name
  end

  def self.create(email:, password:, name:, username:)
    DatabaseSetup.setup
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name,
    username) VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id,
    email, username, name;")
    User.new(id: result[0]['id'], email: result[0]['email'],
    name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'],
    username: result[0]['username'], name: result[0]['name'])
  end

  def self.authenticate(username:, password:)
    DatabaseSetup.setup
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'],
    username: result[0]['username'], name: result[0]['name'])
  end
end
