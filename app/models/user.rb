require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id,         Serial
  property :full_name,  String
  property :username,   String
  property :email,      String

end
