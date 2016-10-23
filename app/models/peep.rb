require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'


class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :name,    String

end

DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
