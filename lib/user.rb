require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
  property :email, String, unique: true
  property :password_digest, Text

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password) #encrypts the user's password
  end

end