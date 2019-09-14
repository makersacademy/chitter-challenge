require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :user_id, :name, :email, :handle

  def initialize(user_id:, name:, email:, handle:)
    @user_id = user_id
    @name = name
    @email = email
    @handle = handle
  end

  def self.create(name:, email:, password:, handle:)
    check_email_exist = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    check_handle_exist = DatabaseConnection.query("SELECT * FROM users WHERE handle = '#{handle}';")
    return if check_email_exist.any? || check_handle_exist.any?
    
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password, handle)
     VALUES ('#{name}', '#{email}', '#{encrypted_password}', '#{handle}')
     RETURNING id, name, email, password, handle;")
    User.new(user_id: result[0]['id'], name: result[0]['name'],
       email: result[0]['email'], handle: result[0]['handle'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    
    return unless BCrypt::Password.new(result[0]['password']) == password
    
    User.new(user_id: result[0]['id'], name: result[0]['name'],
       email: result[0]['email'], handle: result[0]['handle'])
  end

end
