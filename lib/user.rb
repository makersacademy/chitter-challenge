require 'bcrypt'

class User
  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)
    rs = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(rs[0]['id'], rs[0]['email'])
  end

  def self.authenticate(email, password)
    rs = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless rs.any?
    return unless BCrypt::Password.new(rs[0]['password']) == password
    User.new(rs[0]['id'], rs[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end
end
