require_relative 'database_connection'
require 'bcrypt'
# require './credentials'
require 'mailgun-ruby'



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
    encrypted_password = BCrypt::Password.create(password)
    query = "INSERT INTO users(username, password, email, forename, surname) VALUES ('#{username}', '#{encrypted_password}', '#{email}', '#{forename}', '#{surname}') RETURNING *;"
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

  def self.find(username)
    connection = Users.choose_connection
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    result.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
  end

  def self.username_valid?(username)
    connection = Users.choose_connection
    check = connection.exec("SELECT username FROM users WHERE username = '#{username}';")
    check[0]["username"] != username
    # check.nil?
  end

  def self.email_valid?(email)
    connection = Users.choose_connection
    check = connection.exec("SELECT email FROM users WHERE email = '#{email}';")
    check[0]["email"] != email
    # check.nil?
  end

  def self.password_valid?(password)
    connection = Users.choose_connection
    check = connection.exec("SELECT password FROM users WHERE password = '#{password}';")
    BCrypt::Password.new(check[0]["password"]) != password
    # check.nil?
  end

  def self.login(username, password)
    connection = Users.choose_connection
    user = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    user.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
    BCrypt::Password.new(user[0]["password"]) == password
  end

  def self.confim_signup(email)
    domain = 'sandbox5b32a175946546f3bd75e54dbf8e75c7.mailgun.org'
    mg_client = Mailgun::Client.new(KEY)

    # Define your message parameters
    message_params =  { from: "support@localhost9292.com",
                        to:   email,
                        subject: 'Welcome to Chitter',
                        text:    'Sign up was successful.  Welcome to chitter!!'
                      }
    # Send your message through the client
    mg_client.send_message(domain, message_params)
  end

  def self.choose_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: "chitter")
    end
    connection
  end

end
