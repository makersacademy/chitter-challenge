require 'bcrypt'

class PassHashHandler
  def generate_hash(password)
    return BCrypt::Password.create(password).to_s
  end
  def check_against_hash(password, passhash)
    @passhash = BCrypt::Password.new(passhash)
    return (@passhash == password)
  end
end
