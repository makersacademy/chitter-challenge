require_relative 'encryptor.rb'
require_relative 'database_connection.rb'

class User
  attr_reader :user_id, :username

  def initialize(user_id: user_id, username: username)
    @user_id = user_id
    @username = username
  end

  def self.login(username: username, password: password)
    if password.encrypt == fetch_password(username)
      User.new(user_id: fetch_user_id(username), username: username)
    else raise 'inccorect password'
    end
  end

  def self.create(username: username, email: email, password: password)
    password = password.encrypt
    DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING user_id, username, email, password;")
  end

  def self.fetch_password(username)
    result = DatabaseConnection.query("SELECT password FROM users WHERE username = '#{username}';")
    result[0]['password']
  end

  def self.fetch_user_id(username)
    result = DatabaseConnection.query("SELECT user_id FROM users WHERE username = '#{username}';")
    result[0]['users']
  end

end
