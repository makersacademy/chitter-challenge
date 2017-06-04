require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :posted_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_peeps")
DataMapper.finalize
DataMapper.auto_upgrade!
