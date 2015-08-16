require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  validates_presence_of :email
  validates_presence_of :password_digest

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end