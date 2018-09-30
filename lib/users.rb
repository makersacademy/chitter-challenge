require 'bcrypt'

class Users

  def self.create(email,password)
    return false if Users.exists?(email)
    pw_encrypt = BCrypt::Password.create(password)
    user = DatabaseConnection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{pw_encrypt}') RETURNING id, email")
    Users.new(user[0]['id'],user[0]['email'])
  end

  def initialize(id,email)
    @id = id
    @email = email
  end

  def self.exists?(email)
    result = DatabaseConnection.exec("SELECT * FROM users WHERE email='#{email}'")
    return false if result.ntuples == 0
    return true
  end

  attr_reader :id, :email
end
