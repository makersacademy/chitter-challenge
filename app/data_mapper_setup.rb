require 'data_mapper'
require 'dm-postgres-adapter'


require_relative 'models/user'
require_relative 'models/peep'

link = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || link )
DataMapper.finalize
DataMapper.auto_upgrade!
