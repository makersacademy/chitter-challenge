require 'bcrypt'

class Users

  def self.create(email,password)
    pw_encrypt = BCrypt::Password.create(password)
    user = DatabaseConnection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{pw_encrypt}') RETURNING id, email")
    Users.new(user[0]['id'],user[0]['email'])
  end

  def initialize(id,email)
    @id = id
    @email = email
  end

  attr_reader :id, :email
end
