require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :user_id, :name, :email, :password, :handle

  def initialize(user_id:, name:, email:, password:, handle:)
    @user_id = user_id
    @name = name
    @email = email
    @password = password # need to make private at some point
    @handle = handle
  end

  # for when user signs up
  def self.create(name:, email:, password:, handle:)
    # need a fail clause if handle/email already exists here
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password, handle) VALUES ('#{name}', '#{email}', '#{encrypted_password}', '#{handle}') RETURNING id, name, email, password, handle;")
    User.new(user_id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], handle: result[0]['handle'])
  end

  def self.login(email:, password:)
    DatabaseConnection.query("SELECT id FROM users WHERE email = '#{email}, password = '#{password}")
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(user_id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], handle: result[0]['handle'])
  end

end