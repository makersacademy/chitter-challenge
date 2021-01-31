require 'bcrypt'
require_relative './database_connection'

class User
    attr_reader :id, :email, :user_name

  def initialize(id:, email:, user_name:)
    @id = id
    @email = email
    @user_name = user_name
  end

  def self.create(email:, password:, user_name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, user_name) VALUES('#{email}', '#{encrypted_password}', '#{user_name}'') RETURNING id, email, user_name;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      user_name: result[0]['user_name']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}' ;")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      user_name: result[0]['user_name']
    )
  end

  def self.authenticate(email:, password:, user_name:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' ;")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      user_name: result[0]['user_name']
      )
  end

end