require 'dm-postgres-adapter'
require 'data_mapper'

require './models/user'
require './models/peep'

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
