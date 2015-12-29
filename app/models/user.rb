require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email,  String, required: true, format: :email_address
  property :password_digest, Text
  property :password_confirmation, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
