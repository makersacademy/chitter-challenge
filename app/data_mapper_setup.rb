require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'dm-timestamps'

require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/comment'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
DataMapper::Logger.new($stdout, :debug)
