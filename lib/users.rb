require 'pg'
require 'bcrypt'
require_relative 'database_connection'

class Users
  def self.setup
    @@database = database_connect
  end

  def self.signup(name, username, email, password)
    password = BCrypt::Password.create(password)
    @@database.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING password;")
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
    encrypted_password = BCrypt::Password.new("#{output.first['password']}")
    return true if encrypted_password != password

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


# pass = BCrypt::Password.create("Test")
# puts pass
# puts pass == "Test"
# puts pass == "Test  2"
#
# pass = BCrypt::Password.new("$2a$12$nUXhP5jpAZCVWXrkzn.xn.4yojJV6IiczpW7ZfQQohroseE/EzVT6")
# puts pass == "Test"
#
# pass = BCrypt::Password.create("jack@google.com")
# puts pass
# puts pass == "jack@google.com"
# puts pass == "Test  2"
