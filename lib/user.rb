require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email, :password
  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    result = create_user(name, username, email, password)
    @user = User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
    User.set_current_user(@user)
    @user
  end

  def self.create_user(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, name, username, email, password;")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.set_current_user(user)
    @current_user = user
  end

  def self.current_user
    @current_user ||= "Anonymous"
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any? 
    return unless BCrypt::Password.new(result[0]['password']) == password
    set_current_user(User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password']))
  end

  def self.sign_out
    @current_user = nil
  end

  def self.exists?(email:, username:)
    email = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    username = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    !email.first.nil? || !username.first.nil?
  end
end
