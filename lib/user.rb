require 'bcrypt'
require 'data_mapper'
class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

end