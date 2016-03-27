require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-core'
require 'dm-validations'

connection_string = "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
DataMapper.finalize
