require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user.rb'
require_relative 'models/message.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize
