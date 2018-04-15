require_relative './database_connection'

class User
  attr_reader :id, :name, :username, :password, :email

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @username = options[:username]
    @password = options[:password]
    @email = options[:email]
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users" )
    result.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        username: user['username'],
        password: user['password'],
        email: user['email']

      )
    end
  end

  def self.create(options)
    DatabaseConnection.query("INSERT INTO user(name, username, password, email) VALUES('#{options[:name]}', '#{options[:username]}', '#{options[:password]}', #{options[:uemail]})")
  end
end
