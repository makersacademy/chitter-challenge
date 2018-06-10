require 'bcrypt'
require 'pg'

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
    connection = database_connection
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['name'], user['username']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    connection = database_connection
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{options[:email]}', '#{password}', '#{options[:name]}', '#{options[:username]}') RETURNING id, email, name, username;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    connection = database_connection
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
