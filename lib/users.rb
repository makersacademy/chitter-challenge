require 'pg'
require_relative 'database_connection'

class Users
  def self.setup
    @@database = database_connect
  end

  def self.signup(name, username, email, password)
    @@database.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
    "#{username} registered"
  end

  def self.duplicate_email?(email)
    return false if @@database.query("SELECT email FROM users WHERE email='#{email}'").values == []
    true
  end

  def self.duplicate_username?(username)
    return false if @@database.query("SELECT username FROM users WHERE username='#{username}'").values == []
    true
  end

  def self.get_username(user_id)
    @@database.query("SELECT username FROM users WHERE user_id='#{user_id}'").first['username']
  end

  def self.incorrect_login?(username, password)
    output = @@database.query("SELECT username, password FROM users WHERE username='#{username}';")
    return true if output.first == nil
    return true if output.first['password'] != password

    false
  end

private
	def self.database_connect
		if ENV['ENVIRONMENT'] == 'test'
	 		DatabaseConnection.setup('shouter_database_test')
		else
  		DatabaseConnection.setup('shouter_database')
		end
	end
end
