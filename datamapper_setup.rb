require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default,
ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
