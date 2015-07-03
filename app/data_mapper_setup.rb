env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
#require 'dm-validations'
require 'dm-postgres-adapter'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
