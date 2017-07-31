require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/post'
require_relative 'models/user'

postgres = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres)
DataMapper.finalize
DataMapper.auto_upgrade!
