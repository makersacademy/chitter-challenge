require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-timestamps'


require_relative 'models/user'
local_db_env = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_db_env)
DataMapper.finalize
