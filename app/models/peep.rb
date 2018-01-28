require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String
  property :author,     String
  property :created_at, DateTime

end


DataMapper.setup(:default, "postgres://localhost/chitter_test")

DataMapper.finalize

DataMapper.auto_upgrade!
