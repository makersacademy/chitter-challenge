require 'bcrypt'

class User
  
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  property :username, String  

  # def password=(password)
  #   @password = password
  #   self.password_digest = Bcrypt::Password.create(password)
  # end
end