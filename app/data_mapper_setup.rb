require 'data_mapper'
require './app/models/user.rb'

DataMapper.setup(:default, "postgres://localhost/peep")
DataMapper.finalize
