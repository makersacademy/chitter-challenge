require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :user_name, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
