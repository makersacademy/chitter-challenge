require 'bcrypt'

class Password

  def self.hash(password)
    BCrypt::Password.create(password)
  end

  def self.check_password(username, password)
    stored_password = User.where(username: username).pluck(:password).first
    return false if stored_password.nil? || BCrypt::Password.new(stored_password) != password
    true
  end

end
