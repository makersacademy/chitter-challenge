require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require_relative 'chitter'
require_relative 'models/user'
require_relative 'models/peep'

DataMapper::Property.required(true)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
