require 'bcrypt'

class Maker

  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :username,         String, :unique => true
  property :email,            String, :unique => true
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end