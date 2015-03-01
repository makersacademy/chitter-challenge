require 'data_mapper'
require_relative 'user'
require_relative 'peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!
