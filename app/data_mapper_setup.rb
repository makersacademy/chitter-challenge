require 'data_mapper'
require_relative './models/user'
require_relative './models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
                           "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
