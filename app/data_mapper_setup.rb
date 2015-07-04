env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

require_relative './models/user'

DataMapper.finalize

DataMapper.auto_upgrade!