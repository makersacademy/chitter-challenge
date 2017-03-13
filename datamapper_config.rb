require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'app'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_users_test")

DataMapper.finalize

DataMapper.auto_upgrade!
