require 'data_mapper'
require 'dm-validations'

require './app/models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
