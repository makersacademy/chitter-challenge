require_relative 'database_connection.rb'
require 'bcrypt'

class User
  attr_reader :id, :email, :username
  def initialize(id:,email:,username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(email:,password:,username:)
    valid = check_if_not_unique(email: email,username: username)
    return valid unless valid == nil

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(email,password,username) VALUES($1,$2,$3) RETURNING id,email,username", [email, encrypted_password, username])
    User.new(id: result[0]['id'], email: result[0]['email'],username: result[0]['username'])
  end

  def self.find(id:)
    return nil if id == nil

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  private

  def self.check_if_not_unique(email:,username:)
    email = DatabaseConnection.query("SELECT count(*) FROM users WHERE email=$1;", [email])
    username = DatabaseConnection.query("SELECT count(*) FROM users WHERE username=$1;", [username])
    return 1 if email[0]['count'].to_i > 0
    return 2 if username[0]['count'].to_i > 0
  end

end