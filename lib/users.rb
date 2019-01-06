require_relative 'database_connection'
require 'bcrypt'
require './credentials'
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
    encrypted_password = BCrypt::Password.create(password)
    query = "INSERT INTO users(username, password, email, forename, surname) VALUES ('#{username}', '#{encrypted_password}', '#{email}', '#{forename}', '#{surname}') RETURNING *;"
    result = DatabaseConnection.query(query)
    Users.new(result[0]['username'],
              result[0]['password'],
              result[0]['email'],
              result[0]['forename'],
              result[0]['surname'])
  end

  def self.read
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
  end

  def self.find(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    result.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
  end

  def self.username_valid?(username)
    check = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}';")
    if check.ntuples == 0
      return true
    else
      check[0]["username"] != username
    end
  end

  def self.email_valid?(email)
    check = DatabaseConnection.query("SELECT email FROM users WHERE email = '#{email}';")
    if check.ntuples == 0
      return true
    else
      check[0]["email"] != email
    end
  end

  def self.password_valid?(password)
    check = DatabaseConnection.query("SELECT password FROM users WHERE password = '#{password}';")
    BCrypt::Password.new(check[0]["password"]) != password
  end

  def self.login(username, password)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    user.map do |user|
      Users.new(user['username'], user['password'],
                user['email'], user['forename'], user['surname'])
    end
    BCrypt::Password.new(user[0]["password"]) == password
  end

  def self.confim_signup(email)
    domain = SANDBOX_KEY
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

end
