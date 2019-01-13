require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messaging_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
