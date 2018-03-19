require_relative 'database_connection'

class User
  attr_reader :id, :email, :password, :name, :username
  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['name'], user['username'])}
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) \
    VALUES('#{options[:email]}', '#{options[:password]}', '#{options[:name]}', \
      '#{options[:username]}') RETURNING id, email, password, name, username;")

    User.new(result[0]['id'], result[0]['email'], result[0]['password'], \
      result[0]['name'], result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], \
      result[0]['name'], result[0]['username'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], \
      result[0]['name'], result[0]['username'])
  end
end
