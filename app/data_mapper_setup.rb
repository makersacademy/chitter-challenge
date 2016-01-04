require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'
require_relative 'models/reply.rb'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
