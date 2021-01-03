require "pg"
require "bcrypt"
require_relative "db_connection"

class Signup
  attr_reader :username, :name, :lastname, :email, :password

  def initialize(username:, name:, lastname:, email:, password:)
    @username = username
    @name = name
    @lastname = lastname
    @email = email
    @password = password
  end

  def self.create(username:, name:, lastname:, email:, password:)
    registered = DBConnection.query("SELECT * FROM users WHERE username = '#{username}' OR email = '#{email}'")
    return unless !registered.any?
    encrypted_password = BCrypt::Password.create(password)
    user = DBConnection.query("INSERT INTO users (username, name, lastname, email, password) VALUES('#{username}','#{name}', '#{lastname}', '#{email}', '#{encrypted_password}') RETURNING username, name, lastname, email; ")
    Signup.new(
      username: user[0]["username"],
      name: user[0]["name"],
      lastname: user[0]["lastname"],
      email: user[0]["email"],
      password: user[0]["password"],
    )
  end
end
