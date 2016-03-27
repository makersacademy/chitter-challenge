require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV["ENV_RACK"]}")
DataMapper.finalize
