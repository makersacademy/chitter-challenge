require 'bcrypt'

class User

  class << self
    attr_reader :current
  end

  def self.create(username:, password:, name:, email:)
    encrypted_password = BCrypt::Password.create(password)
    query = "INSERT INTO users VALUES('#{username}', '#{encrypted_password}', '#{name}', '#{email}');"
    DatabaseConnection.query(query)
    login(username, password)
  end

  def self.all
    query = "SELECT * FROM users;"
    rows = DatabaseConnection.query(query)
    rows.map do |row|
      User.new(
        username: row["username"],
        password: row["password"],
        name: row["name"],
        email: row["email"]
      )
    end
  end

  def self.authenticate(username:, password:)
    return false unless valid?(username, password)
    login(username, password)
    true
  end

  def self.sign_out
    @current = nil
  end

  def self.find(username)
    query = "SELECT * FROM users WHERE username = '#{username}'"
    result = DatabaseConnection.query(query).first
    User.new(
      username: username,
      password: BCrypt::Password.new(result["password"]),
      name: result["name"],
      email: result["email"]
    )
  end

  private_class_method
  def self.login(username, password)
    query = "SELECT * FROM users WHERE username = '#{username}';"
    result = DatabaseConnection.query(query)
    @current = User.new(
      username: username,
      password: password,
      name: result.first["name"],
      email: result.first["email"]
    )
  end

  def self.valid?(username, password)
    query = "SELECT * FROM users WHERE username = '#{username}';"
    result = DatabaseConnection.query(query)
    return false unless result.any?
    return false unless BCrypt::Password.new(result[0]["password"]) == password
    return true
  end

  attr_reader :username, :password, :name, :email
  def initialize(username:, password:, name:, email:)
    @username, @password, @name, @email = username, password, name, email
  end
end
