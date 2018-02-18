require 'pg'
require_relative 'database_connection'

class User

  attr_reader :id, :name, :username, :email, :password

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(email, password, name, username)
    return false unless !email_in_use?(email) && !username_in_use?(username) && valid?(username, name, password)
    DatabaseConnection.query("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
  end

  def self.email_in_use?(email)
    result = DatabaseConnection.query("SELECT email FROM users WHERE email = '#{email}'")
    result.select { |hash| hash['email'] == email }.count > 0

  end

  def self.username_in_use?(username)
    result = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}'")
    result.select { |hash| hash['username'] == username }.count > 0
  end

  def self.valid?(username, name, password)
    username.length >= 4 && name.length >=4 && password.length >= 4
  end

  def self.matching_data(username, password)
    result = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}' AND password = '#{password}'")
    result.map { |hash| hash['username'] == username && hash['password' == password]}.count == 1
  end

  def self.instanciate(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

end
