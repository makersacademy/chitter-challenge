require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-timestamps'

require './app/models/user'
require './app/models/peep'

local_db_name = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_db_name)
DataMapper.finalize
