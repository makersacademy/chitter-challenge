require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'
require_relative 'modles/user'
require_relative 'modles/peep'

DataMapper.setup(:default, "postgres://localhost/Chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
