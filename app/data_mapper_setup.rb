require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
