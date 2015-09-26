require 'data_mapper'
require 'dm-timestamps'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
