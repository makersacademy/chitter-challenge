require 'data_mapper'
require 'dm-postgres-adapter'

class Post

  include DataMapper::Resource

  property :id,     Serial
  property :tip,    String

end


DataMapper.setup(:default, "postgres://localhost/fitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
