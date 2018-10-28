require 'bcrypt'
require_relative 'database_connection'

class User
  USERNAME_ALREADY_IN_USE = :used_username
  EMAIL_ALREADY_IN_USE = :used_email

  attr_reader :id, :name, :username, :email
  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def peeps
    Peep.where(user_id: @id)
  end

  def self.create(name:, username:, email:, password:)
    return USERNAME_ALREADY_IN_USE if User.username_exsist?(username)
    return EMAIL_ALREADY_IN_USE if User.email_exsist?(email)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) "\
      "VALUES('#{name}', '#{username}','#{email}', '#{encrypted_password}') "\
      "RETURNING id, name, username, email, password;").first
    User.new(id: result['id'], name: result['name'], 
      username: result['username'], email: result['email'])
  end

  def self.find(column:, value:)
    return nil if column.nil?
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE #{column} = '#{value}'").first
    return nil if result.nil?
    User.new(
      id: result['id'],
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE "\
      "username = '#{username}'").first
    return if result.nil?
    return unless BCrypt::Password.new(result['password']) == password
    User.new(
      id: result['id'],
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  private_class_method

  def self.username_exsist?(username)
    !!User.find(column: "username", value: username)
  end

  def self.email_exsist?(email)
    !!User.find(column: "email", value: email)
  end
  
end
