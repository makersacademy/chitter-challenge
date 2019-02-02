require 'bcrypt'

class PasswordManager

  def self.hash(password)
    BCrypt::Password.create(password).to_s
  end

  def self.match_hash(password, hash)
    remade_hash = BCrypt::Password.new(hash)
    remade_hash == password
  end


end