require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class UserDetails
  include DataMapper::Resource

  property :id,     Serial
  property :handle, String
  property :name,   String
  property :email,  String
  property :password, Text
end

data_mapper_setup
