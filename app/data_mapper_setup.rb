require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, 'postgres://localhost/chitter_#{RACK_ENV}')
DataMapper.finalize
