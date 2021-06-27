require 'bcrypt'
require_relative './database_connection'
require 'uri'
require_relative './peep'

class User
  def self.create(email:, password:, name:, username:)
    return false unless username_unique?(username)
    return nil unless email_unique?(email)

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

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(
      user_id: result[0]['user_id'], 
      email: result[0]['email'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  def self.username_unique?(username)
    result = DatabaseConnection.query("SELECT 1 FROM users WHERE username ='#{username}'")
    not_found?(result)
  end

  def self.email_unique?(email)
    result = DatabaseConnection.query("SELECT 1 FROM users WHERE email ='#{email}'")
    not_found?(result)
  end

  def self.not_found?(result)
    begin
      result[0]
    rescue StandardError
      true
    else
      false
    end
  end

  attr_reader :user_id, :email, :name, :username

  def initialize(user_id:, email:, name:, username:)
    @user_id = user_id
    @email = email
    @name = name
    @username = username
  end

  def peeps(peep_class = Peep)
    peep_class.who(user_id: user_id)
  end
end
