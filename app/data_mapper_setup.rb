require 'require_all'
require 'data_mapper'
require 'dm-postgres-adapter'
require_all 'models/*'

env = ENV['RACK_ENV']
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
