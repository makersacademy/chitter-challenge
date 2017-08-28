require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep'

# this class defines our user table
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :peeps, through: Resource
end
