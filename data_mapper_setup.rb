require 'data_mapper'
require 'dm-postgres-adapter'
require './app/user.rb'

# need to require models that use DM to connect to DB
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/Chitter_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
