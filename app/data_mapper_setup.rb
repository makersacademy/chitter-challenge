require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative 'models/peeps'
require_relative 'models/users'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!