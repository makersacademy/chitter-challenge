require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/post'

postgres = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres)
DataMapper.finalize
DataMapper.auto_upgrade!
