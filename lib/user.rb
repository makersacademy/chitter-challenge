require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String
  property :passowrd_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.creat(password)
  end

end