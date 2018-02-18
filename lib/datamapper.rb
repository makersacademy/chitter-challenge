# require 'rubygems'
require 'data_mapper'

if ENV['environment'] == 'test'
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end
