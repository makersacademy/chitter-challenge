require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter-challenge-#{ENV['RACK_ENV']}")
DataMapper.finalize

DataMapper.auto_migrate!
DataMapper.auto_upgrade!
