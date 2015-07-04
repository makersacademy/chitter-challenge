require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, Text
  property :password_digest, Text
  # property :name, Text
  # property :surname, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end