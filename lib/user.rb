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
    User.check_environment
    result = @connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name'], user['username'],
      user['email'], user['password'])
    }

  end

  def self.create(options)
    User.check_environment
    password = BCrypt::Password.create(options[:password])
    result = @connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{options[:name]}','#{options[:username]}', '#{options[:email]}', '#{password}') RETURNING id, name, username, email, password")
    User.new(result.first['id'], result.first['name'], result.first['username'], result.first['email'], result.first['password'])
  end

  def self.find(id)
    return nil unless id
    result = @connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result.first['id'], result.first['name'], result.first['username'], result.first['email'], result.first['password'])
  end

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
