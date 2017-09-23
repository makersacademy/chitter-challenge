require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :text, String
  property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter1")
DataMapper.finalize
DataMapper.auto_upgrade!
