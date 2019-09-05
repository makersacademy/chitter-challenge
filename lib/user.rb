require 'bcrypt'
require 'valid_email2'

class User
  def self.create(email, password)
    # raise 'User is already signed up' if user_exists?(email)
    return "#{email} is already signed up" if user_exists?(email)
    return "#{email} is not a valid email" unless valid_email?(email)
    encrypted_password = BCrypt::Password.create(password)
    sql = %q{INSERT INTO users (email, password) VALUES ($1, $2) RETURNING id, email;}
    rs = DatabaseConnection.query(sql, [Mail::Address.new(email).address, encrypted_password])
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

  private_class_method def self.user_exists?(email)
    rs = DatabaseConnection.query(%q{SELECT * FROM users WHERE email = $1;}, [email])
    rs.any?
  end

  private_class_method def self.valid_email?(email)
    ValidEmail2::Address.new(email).valid?
  end

  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end
end
