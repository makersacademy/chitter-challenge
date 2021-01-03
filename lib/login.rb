require "pg"
require "bcrypt"
require_relative "db_connection"

class Login
  attr_reader :username, :name, :email

  def initialize(username:, name:, email:)
    @username = username
    @name = name
    @email = email
  end

  def self.authenticate(email:, password:)
    user = DBConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless user.any? #is the user registered?
    return unless BCrypt::Password.new(user[0]["password"]) == password
    Login.new(
      username: user[0]["username"],
      name: user[0]["name"],
      email: user[0]["email"],
    )
  end
  def self.find(username:)
    return nil unless username
    user = DBConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    Login.new(
      username: user[0]["username"],
      name: user[0]["name"],
      email: user[0]["email"],
    )
  end
end
