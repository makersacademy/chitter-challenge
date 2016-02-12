require 'data_mapper'
require 'dm-postgres-adapter'

class Message

  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :username, String
  property :time, String

end

DataMapper.setup(:default, "postgres://localhost/chitter_test" )
DataMapper.finalize
DataMapper.auto_upgrade!
