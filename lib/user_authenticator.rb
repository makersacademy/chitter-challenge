require 'bcrypt'

class UserAuthenticator

  def self.valid?(username, password)
    user = DatabaseConnection.query("SELECT username, password FROM users WHERE username='#{username}'")
    valid_username?(user) && valid_password?(user, password)
  end

  private

  def self.valid_username?(user)
    !user.ntuples.zero?
  end

  def self.valid_password?(user, password)
    BCrypt::Password.new(user[0]['password']) == password
  end

end
