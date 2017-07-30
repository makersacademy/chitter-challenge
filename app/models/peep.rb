require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :created_at, DateTime


end
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_development")
DataMapper.finalize
DataMapper.auto_upgrade!
