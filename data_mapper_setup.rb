require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/peep_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
