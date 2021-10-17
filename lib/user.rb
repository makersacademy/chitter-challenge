require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :name, :email

  def initialize(id:, username:, name:, email:)
    @id = id
    @username = username
    @name = name
    @email = email
  end

  def self.create(username:, name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, name, email, password) VALUES($1, $2, $3, $4) RETURNING id, username, email, password, name;", [username, name, email, encrypted_password]
    )
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.find(user)
    return nil unless user
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [user.id])
    new_user = User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'])
    return new_user
  end
end