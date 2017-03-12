require 'bcrypt'

class User
  include DataMapper::Resource
  property :id, Serial
  property :username, Text
  property :password_digest, Text
  property :email, Text
  property :name, Text

  has n, :peeps, :through => Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
