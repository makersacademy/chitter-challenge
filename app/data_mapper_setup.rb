require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/bottle'

DataMapper.setup(:default, ENV['DATABSE_URL'] || "postgres://localhost/message_in_a_bottle_#{ENV['RACK_ENV']}")
DataMapper.finalize
