require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :email,            String
  property :password_digest,  String, length: 60
  property :name,             String
  property :username,         String

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
