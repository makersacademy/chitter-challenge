require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-migrations'


class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
