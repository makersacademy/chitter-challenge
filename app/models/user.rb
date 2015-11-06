require 'data_mapper'
require 'dm-postgres-adapter'

class User

include DataMapper::Resource

  property :id,     Serial
  property :email,  String
  property :password,   String

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
