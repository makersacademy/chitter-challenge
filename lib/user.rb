require "./lib/database_connection"
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

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name'],
      user['username'], user['email'], user['password'])
    }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (name, username, email,
       password) VALUES('#{options[:name]}', '#{options[:username]}',
        '#{options[:email]}', '#{password}') RETURNING id, name,
        username, email")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'],
    result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'],
    result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return nil unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['name'], result[0]['username'],
    result[0]['email'], result[0]['password'])
  end

end
