require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/post'
require_relative 'models/user'
require_relative 'models/reply'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/fitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
