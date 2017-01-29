require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'


require_relative 'models/user'
require_relative 'models/cheep'

DataMapper.setup(:default, "postgres://localhost/chitter_test")

DataMapper.finalize

DataMapper.auto_upgrade!
