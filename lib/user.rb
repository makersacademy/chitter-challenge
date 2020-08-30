require_relative "database"
require 'bcrypt'

class User

  attr_reader :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name, email, password)
    return "Email Error" unless email_check(email)

    encrypted_password = BCrypt::Password.create(password)

    user = DataBase.query("INSERT INTO users (name,email,password) VALUES ('#{name}', '#{email}','#{encrypted_password}') RETURNING id, name, email;")
    User.new(user.first["id"], user.first["name"], user.first["email"] )
  end

  def self.log_in(email, password)
    return "Email Error" if email_check(email)
    
    user = DataBase.query("SELECT * FROM users WHERE email='#{email}';")

    return "Incorrect password" unless BCrypt::Password.new(user[0]['password']) == password

    User.new(user.first["id"], user.first["name"], user.first["email"] )
  end

  private

  def self.email_check(email)
    user = DataBase.query("SELECT email FROM users WHERE email='#{email}';")
    user.first.nil?
  end

end