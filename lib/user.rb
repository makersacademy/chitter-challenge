require 'bcrypt'
require_relative './database_connection'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(
             id: user[0]['id'],
             email: user[0]['email'],
             )
  end

  def self.find(id:)
    return nil unless id
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
            id: user[0]['id'],
            email: user[0]['email'],
            )
  end

  def self.authenticate(email:, password:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless user.any?
    return unless BCrypt::Password.new(user[0]['password']) == password
    User.new(id: user[0]['id'], email: user[0]['email'])
  end

end
