require_relative './database_connection'
require 'bcrypt'

class User
  attr_reader :id, :fullname, :username, :email

  def initialize(id:, fullname:, username:, email:)
    @id = id
    @fullname = fullname
    @username = username
    @email = email
  end

  def self.create(email:, fullname:, username:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (fullname, username, email, password) VALUES('#{fullname}','#{username}','#{email}', '#{encrypted_password}') RETURNING id, fullname, username, email;")
    User.new(
      id: result[0]['id'],
      fullname: result[0]['fullname'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(
      id: result[0]['id'],
      fullname: result[0]['fullname'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      id: result[0]['id'],
      fullname: result[0]['fullname'], 
      username: result[0]['username'],
      email: result[0]['email'])
  end

end
