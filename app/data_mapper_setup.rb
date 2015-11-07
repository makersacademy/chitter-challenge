require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'
require_relative './models/peep'

LOCAL = "postgres://localhost/chitter_"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "#{LOCAL}#{ENV['RACK_ENV']}")
DataMapper.finalize