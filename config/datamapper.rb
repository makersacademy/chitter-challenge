require './lib/user'
require './lib/message'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/chitter_app_development")
DataMapper.finalize
