require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

class Peep
 include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :timestamp, Time


end

DataMapper.finalize
DataMapper.auto_upgrade!
