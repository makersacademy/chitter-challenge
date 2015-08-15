require 'data_mapper'
require 'dm-timestamps'
require_relative './app/models/peep'
require_relative './app/models/user'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './app/app'

DataMapper.finalize

DataMapper.auto_upgrade!