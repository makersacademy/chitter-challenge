require 'bcrypt'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ ENV["RACK_ENV"] }")
DataMapper.finalize
