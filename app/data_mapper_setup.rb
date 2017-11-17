env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

#require_relative 'models/file_name'
#require_relative 'models/another_file_name'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
