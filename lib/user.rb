require 'bcrypt'

class User

  attr_reader :id, :email, :password, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    hidden_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{hidden_password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], username: result["username"])
  end

  def self.find(id:)

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], username: result["username"])
  end

  def self.authenticate(email:, password:)

    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';").first
    return nil unless result
    return nil unless  BCrypt::Password.new(result['password'])== password
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], username: result["username"])
  end
end
