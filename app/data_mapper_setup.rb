require 'data_mapper'
require './app/models/user.rb'
require './app/models/peep.rb'

DataMapper.setup(:default, "postgres://localhost/peep")
DataMapper.finalize
