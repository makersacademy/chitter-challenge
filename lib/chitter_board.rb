require 'data_mapper'

class ChitterBoard
  include DataMapper::Resource
  
  property :id, Serial 
  property :username, String
  property :email, String
  property :password, BCryptHash

end