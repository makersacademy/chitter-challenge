require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'owl'
require_relative 'twit'

DataMapper.setup(:default, "postgres:///twittwoo_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!