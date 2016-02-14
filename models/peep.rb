require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  
end

DataMapper.finalize
DataMapper.auto_upgrade!