require_relative './database_connection.rb'

class User
  attr_reader :name, :username, :email, :password
  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.find(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    raise "No user found" if result.ntuples.zero?

    User.new(result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.create_user(name, username, email, password)
    result = DatabaseConnection.query("INSERT INTO
      users(name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING name, username, email, password;")
    User.new(result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.username_in_use?(username)
    result = DatabaseConnection.query("SELECT * FROM users 
      WHERE username = '#{username}';")
    result.ntuples > 0
  end

  def self.email_in_use?(email)
    result = DatabaseConnection.query("SELECT * FROM users 
      WHERE email = '#{email}';")
    result.ntuples > 0
  end

  def self.valid_login?(username, password)
    result = DatabaseConnection.query("SELECT * FROM users 
      WHERE username = '#{username}' 
      AND password = '#{password}';")
    result.ntuples > 0
  end
end
