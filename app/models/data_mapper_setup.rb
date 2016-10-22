require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'tag'
require_relative 'link'
require_relative 'user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres:///bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
