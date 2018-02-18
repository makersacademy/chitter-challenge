# require 'rubygems'
require 'data_mapper'

if ENV['environment'] == 'test'
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper::Logger.new($stdout, :debug)
  DataMapper::Model.raise_on_save_failure = false
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end
