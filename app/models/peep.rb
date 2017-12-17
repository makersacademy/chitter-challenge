require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'time'


class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :time, Time
end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_migrate!
