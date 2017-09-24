require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  # Peep class

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :text, String
  property :created_at, DateTime
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
