require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-timestamps'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")



require './app/models/user'
require './app/models/peep'
require './app/models/comment'



DataMapper.finalize
