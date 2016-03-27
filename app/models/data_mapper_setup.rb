require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'
require_relative 'peep'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
# DataMapper.auto_upgrade!
