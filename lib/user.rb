require 'bcrypt'

class User
  attr_reader :id, :fullname, :username

  def initialize(id:, fullname:, username:)
    @id = id
    @fullname = fullname
    @username = username
  end

  def self.create(fullname:, email:, username:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (fullname, email, username, password) VALUES('#{fullname}', '#{email}', '#{username}', '#{encrypted_password}') RETURNING id, fullname, username;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], username: result[0]['username'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], username: result[0]['username'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], username: result[0]['username'])
  end
end
