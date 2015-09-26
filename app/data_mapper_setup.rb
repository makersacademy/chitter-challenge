require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
