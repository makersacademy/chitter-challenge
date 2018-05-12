require 'data_mapper'
require 'pg'
require 'pry'
require 'pry-byebug'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://georgesykes@localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://georgesykes@localhost/chitter')
end

DataMapper.auto_migrate!
DataMapper.finalize
