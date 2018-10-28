require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper::setup(:default, "postgres://san-di@localhost/chitter_test")
else
  DataMapper::setup(:default, "postgres://san-di@localhost/chitter")
end
DataMapper.finalize
