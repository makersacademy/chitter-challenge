require 'data_mapper'
require 'dm-postgres-adapter'
require './models/user'
require './models/peep'

# need to require models that use DM to connect to DB
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
