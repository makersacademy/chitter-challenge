require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/tag'


# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
