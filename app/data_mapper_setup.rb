require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/peep'
require_relative './models/maker'
require_relative './models/comment'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
