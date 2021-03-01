require 'bcrypt'

class User

  attr_reader :id, :email, :username

  def initialize(id:, username:, email:, password:, name:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'],email: result[0]['email'])
  end

end
