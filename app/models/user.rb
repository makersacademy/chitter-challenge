require 'data_mapper'
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
end
