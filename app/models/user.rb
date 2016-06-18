require 'rubygems'
require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource
  
  property :id,              Serial
  property :name,            String
  property :surname,         String 
  property :email,           String 
  property :password_digest, String, length: 60
  property :username,        String 

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
end
