require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'


DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
