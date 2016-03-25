require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,        Serial
  property :user_name, String
  property :email,     String
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
