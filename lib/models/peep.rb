require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text

end

# DataMapper.setup(:default,
# ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
