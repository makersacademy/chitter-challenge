require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/chitter")

class Comment
  include DataMapper::Resource

  property :id,       Serial
  property :comment,  Text 

end


DataMapper.finalize
DataMapper.auto_upgrade!
