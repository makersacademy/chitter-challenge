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
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{options[:email]}', '#{password}', '#{options[:name]}', '#{options[:username]}') RETURNING *")
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end

  def self.find(id_or_email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id_or_email}' OR email ='#{id_or_email}'")
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result.first['password']) == password
    User.new(result.first['id'], result.first['email'], result.first['password'], result.first['name'], result.first['username'])
  end
end
