require 'bcrypt'

class User

  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(result[0]['id'], result[0]['email'])
  end

  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end