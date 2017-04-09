require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/bottle'
require_relative './models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/message_in_a_bottle_#{ENV['RACK_ENV']}")
DataMapper.finalize
