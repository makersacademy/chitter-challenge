require 'data_mapper'
require 'dm-postgres-adapter'

class Chit

  include DataMapper::Resource

  property :id,     Serial
  property :post,  String
  property :time,    String

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
