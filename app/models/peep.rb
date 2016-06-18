require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,            Serial
  property :handle,        String
  property :peep_content,  String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_sdawes_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
