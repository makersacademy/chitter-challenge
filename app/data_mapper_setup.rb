require 'data_mapper'
require 'dm-postgres-adapter'
require 'database_cleaner'


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_database_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
