require 'bcrypt'

class EncryptedPassword
  def initialize(password)
    @password = password
  end

  def encrypted_password
    encrypted_password = BCrypt::Password.create(@password)
  end
end
