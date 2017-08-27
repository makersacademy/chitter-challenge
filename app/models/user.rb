require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :peeps, through: Resource
end

# DataMapper.auto_upgrade!
