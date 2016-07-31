env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
