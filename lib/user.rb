require 'bcrypt'
require_relative '../database_connection_setup'
class User
  attr_reader :id, :email, :password, :name, :username
  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(options)
    return false if in_base?(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{options[:email]}', '#{password}', '#{options[:name]}', '#{options[:username]}') RETURNING *")
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result.first['password']) == password
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end

  def self.list
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['name'], user['username']) }
  end

  def self.in_base?(options)
    list.map { |user| user.email }.include?(options[:email]) || list.map { |user| user.username }.include?(options[:username])
  end
end
