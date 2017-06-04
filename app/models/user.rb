require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
    password_digest = BCrypt::Password.create(password)
  end

end
