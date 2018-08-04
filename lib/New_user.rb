require './lib/database_connection'
require 'bcrypt'

class New_user
  attr_reader :id, :username, :email, :password

  def initialize(id, email, username, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = Database_connection.query("SELECT * FROM users")
    result.map { |user| New_user.new(user['id'], user['username'], user['email'], user['password']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = Database_connection.query("INSERT INTO users (username, email ,password) VALUES('#{options[:username]}', '#{options[:email]}', '#{options[:password]}') RETURNING id, username, email, password;")
    New_user.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = Database_connection.query("SELECT * FROM users WHERE id = '#{id}'")
    New_user.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(username, email, password)
    result = Database_connection.query("SELECT * FROM users WHERE email = '#{email}'")
    New_user.new(result[0]['id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end
end
