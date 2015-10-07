require 'data_mapper'
require 'dm-timestamps'

env = ENV['RACK_ENV'] || 'development'
LOCAL_DATABASE = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || LOCAL_DATABASE)

require './app/models/user'
require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
