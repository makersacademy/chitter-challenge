require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :email, :username, :userhandle, :password

  def initialize(id, email, username, userhandle, password)
    @id = id
    @email = email
    @username = username
    @userhandle = userhandle
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['username'], user['userhandle'], user['password']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (email, username, userhandle, password) VALUES('#{options[:email]}', '#{options[:username]}', '#{options[:userhandle]}', '#{options[:password]}') RETURNING id, email, username, userhandle, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['userhandle'], result[0]['password'])
  end


  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['userhandle'], result[0]['password'])
  end
end
