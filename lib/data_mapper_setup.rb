require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{ ENV['RACK_ENV']}")

DataMapper.finalize
#DataMapper.auto_migrate! #needed to activate not null in DB
DataMapper.auto_upgrade!
