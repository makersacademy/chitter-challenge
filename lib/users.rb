require 'bcrypt'

class Users
  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email;")
    Users.new(id: result[0]['id'], email: email, username: username)
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    Users.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end
end
