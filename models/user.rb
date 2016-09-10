require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../data_mapper_setup'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,  String
  property :email,      String
  property :password,   Text

end
