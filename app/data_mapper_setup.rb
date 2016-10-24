require 'data_mapper'
require 'dm-timestamps'
require 'dm-postgres-adapter'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
