require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :password_digest, Text
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  property :name, String
  property :username, String
  
end