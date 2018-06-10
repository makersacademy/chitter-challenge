require 'pg'
require 'bcrypt'
require_relative './database_connection'

class User

  attr_reader :id, :username

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.save(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (username, email, password, name) VALUES('#{options[:username]}', '#{options[:email]}', '#{password}', '#{options[:name]}') RETURNING id, name, username, email, password;")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email'], user['password']) }
  end

  def self.already_exists?(options)
    User.all.map(&:username).include?("#{options[:username]}")
  end

  def self.authenticate(username, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}';")
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

end
