require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'model/user'
require_relative 'model/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
