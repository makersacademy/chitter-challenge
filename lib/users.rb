require 'bcrypt'

class Users
  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id.to_i
    @email = email
    @username = username
  end

  def self.create(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, username, password) VALUES('#{email}', '#{username}', '#{encrypted_password}') RETURNING id, email, username;")
    Users.new(id: result[0]['id'], email: email, username: username)
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    Users.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    Users.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end
end
