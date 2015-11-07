# require_relative 'models/user.rb'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/peep")
DataMapper.finalize
