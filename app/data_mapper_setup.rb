require 'data_mapper'
require 'dm-timestamps'

env = ENV['RACK_ENV'] || 'development'
LOCAL_DATABASE = "postgres://localhost/chitter_challenge_#{env}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || LOCAL_DATABASE)

require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
