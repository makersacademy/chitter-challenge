require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'lib/peep'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
else
  DataMapper.setup(:default, "postgres://localhost/chitter")
end  
DataMapper.finalize
DataMapper.auto_upgrade!
