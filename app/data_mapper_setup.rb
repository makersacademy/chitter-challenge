require 'data-mapper'
require 'dm-postgres-mapper'

DataMapper.setup(:default, ENV['DATABSE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!