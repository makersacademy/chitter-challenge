require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/post'
require_relative 'models/comment'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
