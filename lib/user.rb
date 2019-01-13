require 'data_mapper'
require 'dm-validations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :username, Text
  property :email, Text
  property :password, BCryptHash

end
