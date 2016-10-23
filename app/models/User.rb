require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def post(peep)

  end
  
end
