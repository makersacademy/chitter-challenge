require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../app/models/user'
require_relative '../app/models/peep'
require 'sinatra/flash'

alt_path = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || alt_path)
DataMapper.finalize
DataMapper.auto_upgrade!
