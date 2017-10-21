ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String

end


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
