require 'data_mapper'
require_relative './models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
                           "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
