require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'dm-timestamps'

require_relative 'models/user'
require_relative 'models/peep'

#a
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize

