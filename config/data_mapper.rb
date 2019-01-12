require 'data_mapper'
require './lib/message'
require './lib/user'


DataMapper.setup(:default, "postgres://localhost/Chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize

if ENV['RACK_ENV'] == 'development'
  DataMapper.auto_upgrade!
elsif ENV['RACK_ENV'] == 'test'
  DataMapper.auto_migrate!
end