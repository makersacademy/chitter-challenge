require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_sdawes_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
