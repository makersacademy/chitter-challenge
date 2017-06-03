require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_test")
# TODO arrange so goes to developer environment not just test 
DataMapper.finalize
DataMapper.auto_upgrade!
