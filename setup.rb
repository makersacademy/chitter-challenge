require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'app/models/peep' #Does this need to be after DataMapper.setup?

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
