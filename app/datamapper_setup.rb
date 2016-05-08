require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require './app/models/user'
require './app/models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize