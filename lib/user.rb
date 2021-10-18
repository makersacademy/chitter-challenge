require_relative "database_connection"
require_relative "database_connection_setup"
require 'bcrypt'

class User

	attr_reader :id, :username

	def initialize(id:, username:)
    @id = id
    @username = username
  end

	def self.create(username:, password:, password_confirmation:)
		return false unless password_confirmation?(password, password_confirmation) && !DatabaseConnection.query("SELECT * FROM users WHERE username = $1;", [username]).first
		encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, password) VALUES($1, $2) RETURNING id, username;", [username, encrypted_password])
    User.new(id: result.first['id'], username: result.first['username'])
  end

	def self.log_in(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1;", [username])
		return false unless BCrypt::Password.new(result.first['password']) == password
		User.new(id: result.first['id'], username: result.first['username'])
  end

	def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    User.new(id: result.first['id'], username: result.first['username'])
  end

  def messages(message_class = Message)
    message_class.where(user_id: id)
  end

	private 

	def self.password_confirmation?(password, password_confirmation)
		password == password_confirmation
  end

end