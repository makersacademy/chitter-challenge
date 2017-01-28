require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'


require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_test")

DataMapper.finalize

DataMapper.auto_upgrade!
