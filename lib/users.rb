#require 'uri'

class Users
  attr_reader :name, :username, :email, :password

  def initialize(name, email, username, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| Users.new(user['name'], user['email'], user['username'], user['password']) }
  end

  def self.register(options)
    DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES('#{options[:name]}', '#{options[:email]}', '#{options[:username]}', '#{options[:password]}')")
  end

end
