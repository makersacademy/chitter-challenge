require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
