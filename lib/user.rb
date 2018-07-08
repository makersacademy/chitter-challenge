require 'pg'
require 'bcrypt'
require_relative './peep'
require_relative './database_connection.rb'

class User

  include Database


  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name, username, email, password)
    connection = Database::Connection.create
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}','#{username}','#{email}','#{encrypted_password}') RETURNING id, name, username, Email")
    User.new(result.first['id'], result.first['name'], result.first['username'], result.first['email'])
  end

  def self.find(email)
    connection = Database::Connection.create
    result = connection.exec("SELECT * FROM users WHERE email='#{email}'")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email']) }
  end

  def self.all
    connection = Database::Connection.create
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email']) }
  end

  def self.invalid_username?(username)
    users = User.all
    usernames = users.map { |user| user.username }
    usernames.include?(username)
  end

  def self.invalid_email?(email)
    users = User.all
    emails = users.map { |user| user.email }
    emails.include?(email)
  end

end
