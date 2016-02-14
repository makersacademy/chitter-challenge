require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

# require_relative 'models/tag'
require_relative 'models/peep'
require_relative 'models/user'

DataMapper::Logger.new(STDOUT, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
