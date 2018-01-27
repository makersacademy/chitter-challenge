require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :peeps


  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, Text

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end
end
