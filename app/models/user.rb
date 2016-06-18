require 'rubygems'
require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource
  
  property :id,       Serial
  property :name,     String
  property :surname,  String 
  property :email,    String 
  property :password, String 
  property :username, String 
  
end
