require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require './app/models/user'
require './app/models/message'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}" || ENV['DATABASE_URL'])
DataMapper.finalize
DataMapper.auto_upgrade!
