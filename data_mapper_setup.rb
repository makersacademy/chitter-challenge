require 'dm-postgres-adapter'
require 'data_mapper'

require_relative 'app/models/user'
require_relative 'app/models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
