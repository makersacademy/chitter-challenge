require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
  property :email, String, unique: true
  property :encrypted_password, Text

  def password=(password)
  	self.encrypted_password = BCrypt::Password.create(password) #encrypts the user's password
  end

end