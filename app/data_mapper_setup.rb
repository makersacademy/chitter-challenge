require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/poop'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{RACK_ENV}")
DataMapper.finalize
