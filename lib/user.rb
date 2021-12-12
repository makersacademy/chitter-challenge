require_relative 'database_connection.rb'
require 'bcrypt'

class User
  attr_reader :id, :email, :username, :name
  def initialize(id:,email:,username:,name:)
    @id = id
    @email = email
    @username = username
    @name = name
  end

  def self.create(email:,password:,username:,name:)
    valid = check_if_email_unique(email: email, username: username)
    return valid unless valid == nil

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(email,password,username,name) VALUES($1,$2,$3,$4) RETURNING id,email,username,name", [email, encrypted_password, username, name])
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

  def self.find(id:)
    return nil if id == nil

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

  def self.authenticate(email:,password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1", [email])
    return nil unless result.any? && BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end
  
  private

  def self.check_if_email_unique(email:,username:)
    email = DatabaseConnection.query("SELECT count(*) FROM users WHERE email=$1;", [email])
    username = DatabaseConnection.query("SELECT count(*) FROM users WHERE username=$1;", [username])

    return 1 if email[0]['count'].to_i > 0
    return 2 if username[0]['count'].to_i > 0
  end

end