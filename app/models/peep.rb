require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :peep,     String

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!

# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
