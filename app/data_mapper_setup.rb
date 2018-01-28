require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep'
require_relative 'models/user'


db = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || db)
DataMapper.finalize
DataMapper.auto_upgrade!
