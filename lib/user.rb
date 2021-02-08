require 'bcrypt'
require_relative './database_connection'

class User
    attr_reader :user_id, :email, :user_name

  def initialize(user_id:, email:, user_name:)
    @user_id = user_id
    @email = email
    @user_name = user_name
  end

  def self.create(email:, password:, user_name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, user_name) VALUES('#{email}', '#{encrypted_password}', '#{user_name}') RETURNING user_id, email, user_name;")
    User.new(
      user_id: result[0]['user_id'],
      email: result[0]['email'],
      user_name: result[0]['user_name']
    )
  end

  def self.find(user_id:)
    return nil unless user_id
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = #{user_id};")
    User.new(
      user_id: result[0]['user_id'],
      email: result[0]['email'],
      user_name: result[0]['user_name']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' ;")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      user_id: result[0]['user_id'], 
      email: result[0]['email'], 
      user_name: result[0]['user_name']
      )
  end

end