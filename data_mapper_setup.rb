require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'lib/peep'

DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
