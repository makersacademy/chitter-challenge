require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,                    Serial
  property :username,              Text
  property :name,                  Text
  property :email,                 Text
  property :password_digest,       Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
