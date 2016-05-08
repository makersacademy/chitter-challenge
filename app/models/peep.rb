require 'data_mapper'
require 'dm-postgres-adapter'
require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :time, DateTime

end

# DataMapper.finalize
# DataMapper.auto_upgrade!
