require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, 		Serial
  property :email_address, 	String
  property :user_name, 		String
  property :real_name, 		String
  property :password_digest, 	Text
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
