require 'bcrypt'

class User
  def self.create(email, password)
    encrypted_password = BCrypt::Password.create(password)
    sql = %q{INSERT INTO users (email, password) VALUES ($1, $2) RETURNING id, email;}
    rs = DatabaseConnection.query(sql, [email, encrypted_password])
    User.new(rs[0]['id'], rs[0]['email'])
  end

  def self.authenticate(email, password)
    rs = DatabaseConnection.query(%q{SELECT * FROM users WHERE email = $1;}, [email])
    return unless rs.any?
    return unless BCrypt::Password.new(rs[0]['password']) == password
    User.new(rs[0]['id'], rs[0]['email'])
  end

  def self.find(id)
    rs = DatabaseConnection.query(%q{SELECT * FROM users WHERE id = $1;}, [id])
    return unless rs.any?
    User.new(rs[0]['id'], rs[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end
end
