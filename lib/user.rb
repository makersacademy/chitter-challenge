require "bcrypt"

class User
  def self.create(email:, password:, name:, user_name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password, name, user_name) VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{user_name}') RETURNING id, email, password, name, user_name;").first
    @user = User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], user_name: result["user_name"])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};").first
    @user = User.new(id: result["id"], email: result["email"], password: result["password"], name: result["name"], user_name: result["user_name"])
  end

  def self.find_name(id)
    result = DatabaseConnection.query("SELECT name FROM users WHERE id = #{id};")
    result.first["name"]
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
