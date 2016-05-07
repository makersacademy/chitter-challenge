require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :body,   Text

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
