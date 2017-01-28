require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
	
  include DataMapper::Resource

  property :id,			Serial
  property :content,	String
  property :time,		Time

end

DataMapper.setup(:default, ENV['DATABASE_URL']||"postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!