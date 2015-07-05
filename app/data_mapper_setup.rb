env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require './app/models/user'
# require_relative './models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
