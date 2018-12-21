require_relative 'database_connection'

class Users
  attr_reader :id, :username, :password, :email, :forename, :surname

  def initialize(username, password, email, forename, surname)
    @username = username
    @password = password
    @email = email
    @forename = forename
    @surname = surname
  end

  def self.create(username, password, email, forename, surname)
    connection = Users.choose_connection
    query = "INSERT INTO users(username, password, email, forename, surname) VALUES ('#{username}', '#{password}', '#{email}', '#{forename}', '#{surname}') RETURNING *;"
    result = connection.exec(query)
    Users.new(result[0]['username'],
              result[0]['password'],
              result[0]['email'],
              result[0]['forename'],
              result[0]['surname'])
  end

  def self.read
    connection = Users.choose_connection
    result = connection.exec("SELECT * FROM users;")
    result.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
  end

  def self.username_valid?(username)
    connection = Users.choose_connection
    check = connection.exec("SELECT username FROM users WHERE username = '#{username}';")
    check.nil?
  end

  def self.email_valid?(email)
    connection = Users.choose_connection
    check = connection.exec("SELECT email FROM users WHERE email = '#{email}';")
    check.nil?
  end

  def self.choose_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection
  end
end


Users.username_valid?("Ajay12")
Users.read
