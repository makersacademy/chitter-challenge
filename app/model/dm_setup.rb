require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'owl'
require_relative 'twit'

DataMapper.setup(:default, "postgres:///TwitTwoo_#{ENV['RACK_ENV']}")
DataMapper.finalize