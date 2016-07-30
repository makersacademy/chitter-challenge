require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email, String
  property :name, String
  property :password_digest, String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
