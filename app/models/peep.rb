require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :user_handle, String

end

# DataMapper.setup(:default, "postgres://localhost/chitter_development")
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!