require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String
  property :name,           String
  property :username,       String
  property :user_password,  Text

  has n, :peeps

  def password=(password)
    self.user_password = BCrypt::Password.create(password)
  end

end
