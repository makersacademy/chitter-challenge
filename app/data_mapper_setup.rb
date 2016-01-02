require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

database_name = "postgres://localhost/chitter_#{ENV["RACK_ENV"]}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database_name)
DataMapper.finalize
