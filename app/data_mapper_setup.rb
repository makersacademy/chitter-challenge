require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/poop'
require_relative 'models/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{RACK_ENV}")
DataMapper.finalize
DataMapper.auto_upgrade!
