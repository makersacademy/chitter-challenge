require 'bcrypt'

class PasswordManager

  def self.hash(password)
    BCrypt::Password.create(password).to_s
  end

  def self.match_hash(password, hash)
    BCrypt::Password.new(hash) == password
  end

end