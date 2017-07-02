require 'data_mapper'
require 'dm-postgres-adapter'

require './app/models/peep.rb'

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
