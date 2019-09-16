require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :email,      String
  property :password,   String
end
