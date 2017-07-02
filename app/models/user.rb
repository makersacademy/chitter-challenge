require 'data_mapper'
require 'bcrypt'

class User
  
  include DataMapper::Resource
  
  
  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String
  property :password_digest, Text
  
  attr_reader :password
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  
end
