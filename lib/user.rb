require_relative 'database_connection.rb'
require 'bcrypt'

class User
  attr_reader :id, :email
  def initialize(id:,email:)
    @id = id
    @email = email
  end

  def self.create(email:,password:)
    valid = check_if_email_unique(email: email)
    return valid unless valid == nil

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(email,password) VALUES($1,$2) RETURNING id,email", [email, encrypted_password])
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil if id == nil

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:,password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1", [email])
    return nil unless result.any? && BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'])
  end
  
  private

  def self.check_if_email_unique(email:)
    email = DatabaseConnection.query("SELECT count(*) FROM users WHERE email=$1;", [email])
    return 1 if email[0]['count'].to_i > 0
  end

end