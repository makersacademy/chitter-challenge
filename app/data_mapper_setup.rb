require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
# ENV["DATABASE_URL"] || 

require './app/models/user'
require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!