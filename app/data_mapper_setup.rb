require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

require './app/models/tweet'

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/twitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
