require 'bcrypt'

class User

  def self.create(username:, password:, name:, email:)
    encrypted_password = BCrypt::Password.create(password)
    query = "INSERT INTO users VALUES('#{username}', '#{encrypted_password}', '#{name}', '#{email}');"
    DatabaseConnection.query(query)
    login(username, password)
  end

  def self.authenticate(username:, password:)
    return false unless valid?(username, password)
    login(username, password)
    true
  end

  def self.current
    @current
  end

  def self.current=(value)
    @current = value
  end

  private
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
    result = DatabaseConnection.query(query).first
    return false if result.nil?
    return false unless BCrypt::Password.new(result["password"]) == password
    return true
  end
  public




  attr_reader :username, :password, :name, :email
  def initialize(username:, password:, name:, email:)
    @username, @password, @name, @email = username, password, name, email
  end
end
