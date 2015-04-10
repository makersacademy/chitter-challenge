require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  # Bcrypt has god documentation on password recovery as well
  def password=(password)
    password_digest = BCrypt::Password.create(password)
  end
end
