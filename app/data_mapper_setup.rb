require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://namitha:root@localhost/peep_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize