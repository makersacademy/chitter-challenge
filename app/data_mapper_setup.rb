env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
