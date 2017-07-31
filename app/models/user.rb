require 'bcrypt'

class User
  include DataMapper::Resource
  has n, :peeps, through: Resource
  property :id,               Serial
  property :name,             String
  property :username,         String
  property :email,            String
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
