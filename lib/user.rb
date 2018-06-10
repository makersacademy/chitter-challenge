require 'pg'
require_relative './database_connection'

class User

  attr_reader :id, :username

  def initialize(id, name, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.save(options)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password, name) VALUES('#{options[:username]}', '#{options[:email]}', '#{options[:password]}', '#{options[:name]}') RETURNING id, name, username, email, password;")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email'], user['password']) }
  end

  def self.already_exists?(options)
    User.all.map(&:username).include?("#{options[:username]}")
  end

end
