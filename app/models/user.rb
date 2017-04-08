require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :first_name,       String
  property :last_name,        String
  property :email,            String
  property :username,         String
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
