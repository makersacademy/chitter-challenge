require 'bcrypt'
require_relative './database_connection'

class User
  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING user_id, email, name, username;")
    User.new(
      user_id: result[0]['user_id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  def self.find(user_id:)
    return nil unless user_id

    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id ='#{user_id}'")
    User.new(
      user_id: result[0]['user_id'], 
      email: result[0]['email'], 
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  attr_reader :user_id, :email, :name, :username

  def initialize(user_id:, email:, name:, username:)
    @user_id = user_id
    @email = email
    @name = name
    @username = username
  end
end
