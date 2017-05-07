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

  def self.authenticate(params)
    user ||= User.first(email_address: params[:email_address])
    if user && BCrypt::Password.new(user.password_digest) == params[:password]
      true
    else
      false
    end
  end
    

end
