require 'data_mapper'

env = ENV['RACK-ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require_relative 'models/convo'
require_relative 'models/user'
require_relative 'models/tag'

DataMapper.finalize
