require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require_relative 'models/peep'
require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
