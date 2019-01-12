# require './lib/chitter'

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
