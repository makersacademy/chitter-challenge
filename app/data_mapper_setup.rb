require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'

LOCAL = "postgres://localhost/chitter_"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "#{LOCAL}#{ENV['RACK_ENV']}")
DataMapper.finalize