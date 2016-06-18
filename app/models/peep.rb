require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, String

  DataMapper.setup(:default, "postgres://localhost/chitter_chatter_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end