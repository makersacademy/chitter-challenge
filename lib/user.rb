require "bcrypt"

class User
  def self.create(email:, password:, name:, user_name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name, user_name) VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{user_name}') RETURNING id, email, password, name, user_name;").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], user_name: result["user_name"])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};").first
    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], user_name: result["user_name"])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").first

    return nil unless result
    return nil unless BCrypt::Password.new(result["password"]) == password

    User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], user_name: result["user_name"])
  end

  attr_reader :id, :email, :password, :name, :user_name

  def initialize(id:, email:, password:, name:, user_name:)
    @id = id
    @email = email
    @password = password
    @name = name
    @user_name = user_name
  end
end
