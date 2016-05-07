require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :body,   Text

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
