require 'data_mapper'
require_relative './app/models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './app/app'

DataMapper.finalize

DataMapper.auto_upgrade!